# [{"id":"113","parent_id":null,"name":"Россия","areas":[
#     {"id":"1620","parent_id":"113","name":"Республика Марий Эл",
#     "areas":[{"id":"4228","parent_id":"1620","name":"Виловатово","areas":[]},
#              {"id":"1621","parent_id":"1620","name":"Волжск","areas":[]},
#              {"id":"1622","parent_id":"1620","name":"Звенигово","areas":[]},{"id":"4229","parent_id":"1620","name":"Знаменский","areas":[]},{"id":"61","parent_id":"1620","name":"Йошкар-Ола","areas":[]},{"id":"4230","parent_id":"1620",

set @ind = 7;
set @sql = concat('select json->\'$[', @ind, '].id\'');
set @sql = concat(@sql, ',json->\'$[', @ind, '].name\'');
set @sql = concat(@sql, ',json->\'$[', @ind, '].areas[0].name\'');
set @sql = concat(@sql, ',json->\'$[', @ind, '].areas\'');
set @sql = concat(@sql, ' from towns_russia');
select @sql;
PREPARE stmt1 FROM @sql;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

select json -> '$[' + @ind + '].id'
#        ,json->'$[2].name'
#        ,json->'$[@ind].areas[0].name'
from towns_russia;

select *
from towns_russia
where json -> '$.id' = 113;

CREATE TABLE events
(
    id         int auto_increment primary key,
    event_name varchar(255),
    visitor    varchar(255),
    properties json,
    browser    json
);

INSERT INTO events(event_name, visitor, properties, browser)
VALUES ('pageview',
        '1',
        '{
          "page": "/"
        }',
        '{
          "name": "Safari",
          "os": "Mac",
          "resolution": {
            "x": 1920,
            "y": 1080
          }
        }'),
       ('pageview',
        '2',
        '{
          "page": "/contact"
        }',
        '{
          "name": "Firefox",
          "os": "Windows",
          "resolution": {
            "x": 2560,
            "y": 1600
          }
        }'),
       ('pageview',
        '1',
        '{
          "page": "/products"
        }',
        '{
          "name": "Safari",
          "os": "Mac",
          "resolution": {
            "x": 1920,
            "y": 1080
          }
        }'),
       ('purchase',
        '3',
        '{
          "amount": 200
        }',
        '{
          "name": "Firefox",
          "os": "Windows",
          "resolution": {
            "x": 1600,
            "y": 900
          }
        }'),
       ('purchase',
        '4',
        '{
          "amount": 150
        }',
        '{
          "name": "Firefox",
          "os": "Windows",
          "resolution": {
            "x": 1280,
            "y": 800
          }
        }'),
       ('purchase',
        '4',
        '{
          "amount": 500
        }',
        '{
          "name": "Chrome",
          "os": "Windows",
          "resolution": {
            "x": 1680,
            "y": 1050
          }
        }');


SELECT id, browser -> '$.name'
FROM events;

SELECT id, browser ->> '$.name'
FROM events;

SELECT browser ->> '$.name' browser,
       count(browser)
FROM events
GROUP BY browser ->> '$.name';

select id, pict_fname, URL
from goods_pictures
where pict_dir = 'podguz'
  and URL is null
  and id > 0
order by id
limit 10;