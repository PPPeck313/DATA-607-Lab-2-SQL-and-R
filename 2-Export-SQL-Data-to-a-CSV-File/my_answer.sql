/*We want to export a .CSV file that contains total tuberculosis cases 
by country by year. So we need to do some data transformation work in SQL
to get our SELECT statement how we want it, then wrap the SELECT statement 
into a statement that exports the data to a .CSV file. Then we load the 
.CSV file into Excel.*/

copy (
	select country, year, child_cases + adult_cases + elderly_cases as cases
	from(
		select country, year, 
		sum(child) as child_cases, 
		sum(adult) as adult_cases,
		sum(elderly) as elderly_cases
		from tb 
		where child is not null and adult is not null and elderly is not null
		group by country, year
		order by country, year
	) cases_by_group
) to '/Users/prestonpeck/Desktop/SPS/607 Data Acqusition & Management/Lab/Week 2 R and SQL/2 Export SQL data to a CSV file/my_answer.csv' with csv header;