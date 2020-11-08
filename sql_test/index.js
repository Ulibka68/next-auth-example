var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root',
    database : 'next_auth'
});


connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});

connection.query('SELECT * from todo', function (error, results, fields) {
    if (error) throw error;
    console.log('The solution is: ', results[0].id);
});

connection.query('SELECT * FROM todo WHERE id = ?', [1], function (error, results, fields) {
    // error will be an Error if one occurred during the query
    if (error) throw error;
    // results will contain the results of the query
    console.log('The solution2 is: ', results);
    // fields will contain information about the returned results fields (if any)
    // console.log(fields);
});


var CURRENT_TIMESTAMP = { toSqlString: function() { return 'CURRENT_TIMESTAMP()'; } };
var sql = mysql.format('UPDATE todo SET modified = ? WHERE id = ?', [CURRENT_TIMESTAMP, 1]);
console.log('asdasd');
console.log(sql); // UPDATE posts SET modified = CURRENT_TIMESTAMP() WHERE id = 42
console.log('-------------------');
connection.query(sql);

// Getting the id of an inserted row
connection.query('INSERT INTO todo SET ?', {name: 'варенье',modified:CURRENT_TIMESTAMP}, function (error, results, fields) {
    if (error) throw error;
    console.log('Новый id : ' ,results.insertId);
});

// Getting the number of affected rows
connection.query('DELETE FROM todo WHERE id = 1', function (error, results, fields) {
    if (error) throw error;
    console.log('deleted ' + results.affectedRows + ' rows');
})
connection.end();