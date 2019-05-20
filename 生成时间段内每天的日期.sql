CREATE TABLE IF NOT EXISTS datedim  (
    date_id INT NOT NULL auto_increment,
    fulldate date,
    dayofmonth int,
    dayofyear int,
    dayofweek int,
    dayname varchar(10),
    monthnumber int,
    monthname varchar(10),
    year    int,
    quarter tinyint,
    PRIMARY KEY(date_id)
) ENGINE=InnoDB AUTO_INCREMENT=1000;


delimiter //

DROP PROCEDURE IF EXISTS datedimbuild;
CREATE PROCEDURE datedimbuild (p_start_date DATE, p_end_date DATE)
BEGIN
    DECLARE v_full_date DATE;

    DELETE FROM datedim;

    SET v_full_date = p_start_date;
    WHILE v_full_date < p_end_date DO

        INSERT INTO datedim (
            fulldate ,
            dayofmonth ,
            dayofyear ,
            dayofweek ,
            dayname ,
            monthnumber,
            monthname,
            year,
            quarter
        ) VALUES (
            v_full_date,
            DAYOFMONTH(v_full_date),
            DAYOFYEAR(v_full_date),
            DAYOFWEEK(v_full_date),
            DAYNAME(v_full_date),
            MONTH(v_full_date),
            MONTHNAME(v_full_date),
            YEAR(v_full_date),
            QUARTER(v_full_date)
        );

        SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
    END WHILE;
END;

#使用:
 call datedimbuild('2019-01-01','2022-01-01'); 
 select ** from datedim limit 10;
 
#范围 
#2019-01-01 至 2021-12-31

#source 
#http://tech.akom.net/archives/36-Creating-A-Basic-Date-Dimension-Table-in-MySQL.html
