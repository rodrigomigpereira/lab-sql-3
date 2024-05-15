## Lab | SQL Queries 2
## In this lab, you will be using the Sakila database of movie rentals. 

## Instructions
## How many distinct (different) actors' last names are there?

use sakila; ## Use the database sakila 

select * from actor; ## Selecting all info of the table "actor"
select count(last_name) from actor;  ## There are 200 last names
select count(distinct last_name) from actor;  ## There are 121 different last names

## In how many different languages where the films originally produced? (Use the column language_id from the film table)

select * from film;

select count(distinct language_id) from film;  ## 1 

## How many movies were released with "PG-13" rating?

select *
	from film
		where rating = "PG-13"; ## Selecting all info films with ratign PG-13

select count(film_id)
	from film;  ## There are 223 films films with ratign PG-13

## Get 10 the longest movies from 2006.

select * 
	from film
		where release_year = "2006"
			order by length
				desc limit 50;
                
## How many days has been the company operating (check DATEDIFF() function)?

select datediff("2006-02-23", "2005-05-24"); ## It returns the difference between two date values, in years. https://www.w3schools.com/sql/func_sqlserver_datediff.asp

## Show rental info with additional columns month and weekday. Get 20.

select * from rental;
        
select *, monthname(rental_date) as month_rental_date, weekday(rental_date) as weekday_rental_rate
	from rental
		limit 20;
        
## Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, weekday(rental_date) as weekday_rental_rate, dayname(rental_date) as daydame_rental_date
	from rental;  ## I see that the weekdays iqual to "5" and 6 refer to Saturday and Sunday respectively	
    
    select *, 
		weekday(rental_date) as weekday_rental_rate, 
        dayname(rental_date) as daydame_rental_date,
			case 
			when weekday(rental_date) = 5 or weekday(rental_date) = 6 then "weekend"
			else "workday"
			end as day_type
				from rental;
					
## How many rentals were in the last month of activity?

select * from rental;

select max(rental_date) from rental;  ## We see that last month of activity was February 2024

select count(rental_id)
	from rental
		where rental_date > "2006-02-01";

