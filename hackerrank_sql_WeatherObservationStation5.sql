Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

-- CASE1 OK

-- SELECT CITY, LENGTH(CITY)
--     FROM (SELECT CITY, LENGTH(CITY) AS LENG
--             FROM STATION
--             ORDER BY LENG, CITY)
--     WHERE ROWNUM <= 1
-- UNION
-- SELECT CITY, LENGTH(CITY)
--     FROM (SELECT CITY, LENGTH(CITY) AS LENG
--             FROM STATION
--             ORDER BY LENG DESC, CITY)
--     WHERE ROWNUM <= 1;




CASE2 OK

SELECT CITY, LENGTH(CITY)
    FROM (SELECT CITY,
                ROW_NUMBER() OVER(ORDER BY LENGTH(CITY), CITY) AS RN,
                COUNT(*) OVER() AS CNT
            FROM STATION)
    WHERE RN IN (1, CNT);
