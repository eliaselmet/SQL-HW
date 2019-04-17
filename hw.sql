USE sakila;

#1a 
SELECT first_name, last_name
FROM actor;

#1b
select concat(first_name, ' ', last_name) as "Actor Name" from actor;

#2a
select actor_id, first_name, last_name from actor where first_name = 'Joe';

#2b
select first_name, last_name from actor where last_name like '%GEN%';

#2c
select first_name, last_name from actor where first_name like '%LI%' 
order by last_name, first_name;

#2d
select country_id, country from country where country in ('Afghanistan', 'Bangladesh', 'China');

#3a
alter table actor add description BLOB;
select * from actor;

#3b
alter table actor drop column description;
select * from actor;

#4a
select last_name, count(*) from actor group by last_name; 

#4b
select last_name, count(*) from actor group by last_name having count(*) > 1; 

#4c
update actor set first_name = 'HARPO' where first_name = 'Groucho' and last_name = 'Williams';

#4d
update actor set first_name = 'Groucho' where first_name = 'HARPO' and last_name = 'Williams';

#5a
#show create table address;

#6a
Select staff.first_name, staff.last_name, address.address
from staff
inner join address on staff.address_id = address.address_id;

#6b
DROP TABLE IF EXISTS `august_sum`;
CREATE TABLE IF NOT EXISTS `august_sum`
select staff.last_name, payment.amount, payment.payment_date
from staff
join payment on staff.staff_id = payment.staff_id; 

select last_name, sum(amount) 
from august_sum 
where payment_date between '2005-08-01' and '2005-08-31'
group by last_name;


#6c
DROP TABLE IF EXISTS `film_joined`;
CREATE TABLE IF NOT EXISTS `film_joined`
select film.title, film_actor.actor_id 
from film
join film_actor on film.film_id = film_actor.film_id;

select title, count(*)
from film_joined
group by title;

#6d
DROP TABLE IF EXISTS `film_inv`;
CREATE TABLE IF NOT EXISTS `film_inv`
select film.title, inventory.inventory_id 
from inventory
join film on film.film_id = inventory.film_id;

select title , count(*)
from film_inv
where title = 'Hunchback Impossible';

#6e
DROP TABLE IF EXISTS `film_cust`;
CREATE TABLE IF NOT EXISTS `film_cust`
select customer.first_name, customer.last_name, payment.amount
from payment
join customer on customer.customer_id = payment.customer_id;
 
select first_name, last_name, sum(amount) 
from film_cust
group by last_name
order by last_name;

#7a
DROP TABLE IF EXISTS `film_lang`;
CREATE TABLE IF NOT EXISTS `film_lang`
select title, language_id
	from film 
    where language_id in 
    (
		select language_id 
        from language
        where name = 'English' 
	)
;
select title
from film_lang 
where title like 'k%' or
title like 'q%';



