/*Your task is to create an R dataframe that shows rates of tuberculosis infection by country.
You should use the information from the tb database and the attached population.csv file.
Your R dataframe should have the following columns: Country, Year, Rate
Where Rate is defined as Cases/Population.*/

truncate population;
alter sequence population_id_seq restart WITH 0;

copy population(country, year, population)
from '/Users/prestonpeck/Desktop/SPS/607 Data Acqusition & Management/Lab/Week 2 R and SQL/3 Combining Data from Multiple Sources/population.csv'
delimiter ',' csv header;

select c.country, c.year, (cast((child_cases + adult_cases + elderly_cases) as decimal) / population) * 100 as rate
from(
	select country, year, 
	sum(child) as child_cases, 
	sum(adult) as adult_cases,
		sum(elderly) as elderly_cases
		from tb 
		where child is not null and adult is not null and elderly is not null
		group by country, year
		order by country, year
	) as c
left join population as p
on c.country = p.country and c.year = p.year
order by country, year;