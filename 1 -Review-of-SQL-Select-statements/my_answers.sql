/*1. Write a SELECT statement that returns all of the 
rows and columns in the planes table*/
select * from planes;

/*2. Using the weather table, concatenate the year, month, 
and day columns to display a date in the form "3/17/2013".*/
select concat(month, '/', day, '/', year) as date from weather;

/*3. Order by planes table by number of seats, in descending order.*/
select tailnum, seats from planes order by seats desc;

/*4. List only those planes that have an engine that is 'Reciprocating'*/
select * from planes where engine = 'Reciprocating';

/*5. List only the first 5 rows in the flights table*/
select * from planes fetch first 5 rows only;

/*6. What was the longest (non-blank) air time?*/
select max(air_time) as max_air_time from flights;

/*7. What was the shortest (non-blank) air time for Delta?*/
select min(air_time) as min_air_time from flights;

/*8. Show all of the Alaska Airlines flights between June 1st, 2013 
and June 3rd, 2013. Is the way the data is stored in the database 
helpful to you in making your query?*/
select * from flights where 
day >= 1 and day <= 3 
and month = 6 
and year = 2013
and carrier = 'AA';

/*9. Show all of the airlines whose names contain 'America'*/
select * from airlines where name like '%America%';

/*10. How many flights went to Miami?*/
select count(flight) from flights where dest = 'MIA'; --11728

/*11. Were there more flights to Miami in January 2013 or July 2013? 
(Multiple queries are OK)*/
select count(flight) from flights where month = 1 and year = 2013; --27004
select count(flight) from flights where month = 7 and year = 2013; --29425

/*12. What is the average altitude of airports?*/
select avg(alt) as average_altitude from airports;