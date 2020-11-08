var rustown = require("./rustown");
var mysql = require("mysql");
var connection = mysql.createConnection(
  "mysql://root:root@localhost:3306/next_auth?charset=utf8mb4"
);

connection.connect(function (err) {
  if (err) {
    console.error("error connecting: " + err.stack);
    return;
  }

  console.log("connected as id " + connection.threadId);
});

// Getting the id of an inserted row
var bb = {
  type: "obl",
  slug: "moskovskaya",
  label: "Московская",
  localities: [
    {
      type: "city",
      slug: "moskva",
      label: "Москва",
      districts: [
        {
          label: "Академический",
          slug: "akademicheskiy",
        },
        {
          label: "Алексеевский",
          slug: "alekseevskiy",
        },
      ],
    },
  ],
};

console.log(rustown.rustn[0].label);

/*
connection.query(
  "INSERT INTO towns_russia SET ?",
  { json: JSON.stringify(bb) },
  function (error, results, fields) {
    if (error) throw error;
    console.log("Новый id : ", results.insertId);
  }
);
*/
connection.end();
