# https://www.digitalocean.com/community/tutorials/working-with-json-in-mysql

CREATE TABLE `brands`(
                                   `id` INT UNSIGNED NOT NULL auto_increment ,
                                   `name` VARCHAR(250) NOT NULL ,
                                   PRIMARY KEY(`id`)
);

CREATE TABLE `categories`(
                                       `id` INT UNSIGNED NOT NULL auto_increment ,
                                       `name` VARCHAR(250) NOT NULL ,
                                       PRIMARY KEY(`id`)
);
CREATE TABLE `products`(
                                     `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
                                     `name` VARCHAR(250) NOT NULL ,
                                     `brand_id` INT UNSIGNED NOT NULL ,
                                     `category_id` INT UNSIGNED NOT NULL ,
                                     `attributes` JSON NOT NULL ,
                                     PRIMARY KEY(`id`) ,
                                     INDEX `CATEGORY_ID`(`category_id` ASC) ,
                                     INDEX `BRAND_ID`(`brand_id` ASC)
#                                      CONSTRAINT `brand_id` FOREIGN KEY(`brand_id`) REFERENCES `brands`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE ,
#                                      CONSTRAINT `category_id` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

/* Let's sell some televisions */
INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Prime' ,
          '1' ,
          '1' ,
          '{"screen": "50 inch", "resolution": "2048 x 1152 pixels", "ports": {"hdmi": 1, "usb": 3}, "speakers": {"left": "10 watt", "right": "10 watt"}}'
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Octoview' ,
          '1' ,
          '1' ,
          '{"screen": "40 inch", "resolution": "1920 x 1080 pixels", "ports": {"hdmi": 1, "usb": 2}, "speakers": {"left": "10 watt", "right": "10 watt"}}'
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Dreamer' ,
          '1' ,
          '1' ,
          '{"screen": "30 inch", "resolution": "1600 x 900 pixles", "ports": {"hdmi": 1, "usb": 1}, "speakers": {"left": "10 watt", "right": "10 watt"}}'
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Bravia' ,
          '1' ,
          '1' ,
          '{"screen": "25 inch", "resolution": "1366 x 768 pixels", "ports": {"hdmi": 1, "usb": 0}, "speakers": {"left": "5 watt", "right": "5 watt"}}'
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Proton' ,
          '1' ,
          '1' ,
          '{"screen": "20 inch", "resolution": "1280 x 720 pixels", "ports": {"hdmi": 0, "usb": 0}, "speakers": {"left": "5 watt", "right": "5 watt"}}'
      );

# ********************************************************************
/* Let's sell some mobilephones */
INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Desire' ,
          '2' ,
          '2' ,
          JSON_OBJECT(
                  'network' ,
                  JSON_ARRAY('GSM' , 'CDMA' , 'HSPA' , 'EVDO') ,
                  'body' ,
                  '5.11 x 2.59 x 0.46 inches' ,
                  'weight' ,
                  '143 grams' ,
                  'sim' ,
                  'Micro-SIM' ,
                  'display' ,
                  '4.5 inches' ,
                  'resolution' ,
                  '720 x 1280 pixels' ,
                  'os' ,
                  'Android Jellybean v4.3'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Passion' ,
          '2' ,
          '2' ,
          JSON_OBJECT(
                  'network' ,
                  JSON_ARRAY('GSM' , 'CDMA' , 'HSPA') ,
                  'body' ,
                  '6.11 x 3.59 x 0.46 inches' ,
                  'weight' ,
                  '145 grams' ,
                  'sim' ,
                  'Micro-SIM' ,
                  'display' ,
                  '4.5 inches' ,
                  'resolution' ,
                  '720 x 1280 pixels' ,
                  'os' ,
                  'Android Jellybean v4.3'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Emotion' ,
          '2' ,
          '2' ,
          JSON_OBJECT(
                  'network' ,
                  JSON_ARRAY('GSM' , 'CDMA' , 'EVDO') ,
                  'body' ,
                  '5.50 x 2.50 x 0.50 inches' ,
                  'weight' ,
                  '125 grams' ,
                  'sim' ,
                  'Micro-SIM' ,
                  'display' ,
                  '5.00 inches' ,
                  'resolution' ,
                  '720 x 1280 pixels' ,
                  'os' ,
                  'Android KitKat v4.3'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Sensation' ,
          '2' ,
          '2' ,
          JSON_OBJECT(
                  'network' ,
                  JSON_ARRAY('GSM' , 'HSPA' , 'EVDO') ,
                  'body' ,
                  '4.00 x 2.00 x 0.75 inches' ,
                  'weight' ,
                  '150 grams' ,
                  'sim' ,
                  'Micro-SIM' ,
                  'display' ,
                  '3.5 inches' ,
                  'resolution' ,
                  '720 x 1280 pixels' ,
                  'os' ,
                  'Android Lollypop v4.3'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Joy' ,
          '2' ,
          '2' ,
          JSON_OBJECT(
                  'network' ,
                  JSON_ARRAY('CDMA' , 'HSPA' , 'EVDO') ,
                  'body' ,
                  '7.00 x 3.50 x 0.25 inches' ,
                  'weight' ,
                  '250 grams' ,
                  'sim' ,
                  'Micro-SIM' ,
                  'display' ,
                  '6.5 inches' ,
                  'resolution' ,
                  '1920 x 1080 pixels' ,
                  'os' ,
                  'Android Marshmallow v4.3'
              )
      );

# ************************************************************************************
/* Let's sell some cameras */
INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Explorer' ,
          '3' ,
          '3' ,
          JSON_MERGE(
                  '{"sensor_type": "CMOS"}' ,
                  '{"processor": "Digic DV III"}' ,
                  '{"scanning_system": "progressive"}' ,
                  '{"mount_type": "PL"}' ,
                  '{"monitor_type": "LCD"}'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Runner' ,
          '3' ,
          '3' ,
          JSON_MERGE(
                  JSON_OBJECT('sensor_type' , 'CMOS') ,
                  JSON_OBJECT('processor' , 'Digic DV II') ,
                  JSON_OBJECT('scanning_system' , 'progressive') ,
                  JSON_OBJECT('mount_type' , 'PL') ,
                  JSON_OBJECT('monitor_type' , 'LED')
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Traveler' ,
          '3' ,
          '3' ,
          JSON_MERGE(
                  JSON_OBJECT('sensor_type' , 'CMOS') ,
                  '{"processor": "Digic DV II"}' ,
                  '{"scanning_system": "progressive"}' ,
                  '{"mount_type": "PL"}' ,
                  '{"monitor_type": "LCD"}'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Walker' ,
          '3' ,
          '3' ,
          JSON_MERGE(
                  '{"sensor_type": "CMOS"}' ,
                  '{"processor": "Digic DV I"}' ,
                  '{"scanning_system": "progressive"}' ,
                  '{"mount_type": "PL"}' ,
                  '{"monitor_type": "LED"}'
              )
      );

INSERT INTO `products`(
    `name` ,
    `brand_id` ,
    `category_id` ,
    `attributes`
)
VALUES(
          'Jumper' ,
          '3' ,
          '3' ,
          JSON_MERGE(
                  '{"sensor_type": "CMOS"}' ,
                  '{"processor": "Digic DV I"}' ,
                  '{"scanning_system": "progressive"}' ,
                  '{"mount_type": "PL"}' ,
                  '{"monitor_type": "LCD"}'
              )
      );

SELECT JSON_MERGE(
               '{"network": "GSM"}' ,
               '{"network": "CDMA"}' ,
               '{"network": "HSPA"}' ,
               '{"network": "EVDO"}'
           );

/* output: OBJECT */
SELECT JSON_TYPE(attributes) FROM products;

/* It's not that simple */
# this does not work.
SELECT     *
FROM
    products
WHERE
        attributes = '{"ports": {"usb": 3, "hdmi": 1}, "screen": "50 inch", "speakers": {"left": "10 watt", "right": "10 watt"}, "resolution": "2048 x 1152 pixels"}';

SELECT
    *
FROM
    `products`
WHERE
        `category_id` = 1
  AND JSON_EXTRACT(`attributes` , '$.ports.usb') > 0
  AND attributes ->> '$.ports.hdmi' > 0;

UPDATE `products`
SET `attributes` = JSON_INSERT(
        `attributes` ,
        '$.chipset' ,
        'Qualcomm'
    )
WHERE
        `category_id` = 2;

UPDATE `products`
SET `attributes` = JSON_SET(
        `attributes` ,
        '$.body_color' ,
        'red'
    )
WHERE id =4 ;

UPDATE `products`
SET `attributes` = JSON_SET(
        `attributes` ,
        '$.body_color' ,
        'зеленый'
    )
WHERE id =4 ;

# The JSON_INSERT function will only add the property to the object if it does not exists already.
# The JSON_REPLACE function substitutes the property only if it is found.
# The JSON_SET function will add the property if it is not found else replace it.

# ничего не делает
UPDATE `products`
SET `attributes` = JSON_REPLACE(
        `attributes` ,
        '$.body_color1' ,
        'зеленый'
    )
WHERE id =4 ;

# ничего не делает
UPDATE `products`
SET `attributes` = JSON_INSERT(
        `attributes` ,
        '$.body_color' ,
        'зеленый replace'
    )
WHERE id =4 ;

UPDATE `products`
SET `attributes` = JSON_REMOVE(`attributes` , '$.body_color')
WHERE id=4;

select * from
              products,
JSON_TABLE(attributes ,
           '$[*]' COLUMNS (ac VARCHAR(100) PATH '$.screen')
    ) as jt
;
# where id=4;

select * from products where JSON_CONTAINS(attributes,'0','$.ports.usb');
select * from products where JSON_CONTAINS(attributes,'"Digic DV II"','$.processor');
select * from products where JSON_CONTAINS_PATH(attributes,'one','$.processor');
select * from products where JSON_CONTAINS_PATH(attributes,'all','$.ports','$.body_color');

select json->'$.id' from towns_russia;
select JSON_EXTRACT(json,'$.id') from towns_russia;

SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[1]', '$[0]');
SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[2][*]');

SELECT JSON_KEYS(attributes) from products;

SELECT JSON_SEARCH(attributes,'all','"speakers"') from products;

 select os from products,
               json_table(attributes,
                          '$[*]'  columns(os varchar(20) path '$.os')
                ) as json_to_sql_table;


SELECT * FROM
        JSON_TABLE(
        '[ {"c1": 1},{"c2": 2} ]',
               '$[*]' COLUMNS( c1 INT PATH '$.c1' ,c2 int PATH '$.c2')
             ) as jt;


SELECT *
          FROM
       JSON_TABLE(
         '[{"a":"3"},{"a":2},{"b":1},{"a":0},{"a":[1,2]}]',
         '$[*]'
         COLUMNS(
           rowid FOR ORDINALITY,
           ac VARCHAR(100) PATH '$.a' DEFAULT '111' ON EMPTY DEFAULT '999' ON ERROR,
           aj JSON PATH '$.a' DEFAULT '{"x": 333}' ON EMPTY,
           bx INT EXISTS PATH '$.b'
         )
       ) AS tt;


select json->'$.id' from towns_russia;