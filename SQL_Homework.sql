#1a.
select first_name, last_name from actor
#1b.
select upper(concat(first_name,' ', last_name)) as 'Actor Name' from actor
#2a.
select actor_id, first_name, last_name from actor
where first_name = 'Joe'
#2b.
select * from actor
where last_name like '%GEN%'
#2c.
select last_name, first_name from actor
where last_name like '%LI%'
#2d.
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China')
#3a.
alter table actor
add description blob
select * from actor
#3b.
alter table actor
drop description
#4a.
select last_name, count(last_name) as 'Number of Actors Sharing Last Name' from actor
group by last_name
order by count(last_name) desc
#4b.
select last_name, count(last_name) as 'Number of Actors Sharing Last Name' from actor
group by last_name
having count(last_name) >=2
order by count(last_name) desc
#4c.
update actor
set first_name = 'HARPO'
where last_name = 'williams'
and first_name = 'groucho'
#4d.
update actor
set first_name='GROUCHO'
where first_name='HARPO'
#5a.
show create table address
#6a.
select a.first_name, a.last_name, b.address from staff a
inner join address b
on a.address_id=b.address_id
#6b.
select a.first_name, a.last_name, sum(b.amount) as 'total rang' from staff a
inner join payment b
on a.staff_id=b.staff_id
where b.payment_date between '2005-08-01' and '2005-08-31'
group by a.first_name, a.last_name
#6c.
select a.title, count(b.actor_id) as 'Number of Actors' from film a
inner join film_actor b
on a.film_id=b.film_id
group by a.title
order by count(b.actor_id) desc
#6d.
select a.title, count(b.film_id) as 'Total Inventory' from film a
inner join inventory b
on a.film_id = b.film_id
where a.title = 'Hunchback Impossible'
group by a.title
#6e.
select a.first_name, a.last_name, sum(b.amount) as 'Total Amount Paid' from customer a
inner join payment b
on a.customer_id=b.customer_id
group by a.first_name, a.last_name
order by a.last_name
#7a.select title
from film
where title like 'K%' 
or title like 'Q%'
and
	(select language_id
	from language
    where name='English')
#7b.
select first_name, last_name
from actor
where actor_id in
	(select actor_id
    from film_actor
    where film_id in
		(select film_id
        from film
        where title = 'Alone Trip')
        )
#7c.
select a.first_name, a.last_name, a.email from customer a
inner join address b
on a.address_id=b.address_id
inner join city c
on b.city_id=c.city_id
inner join country d
on c.country_id=d.country_id
where d.country='Canada'
#7d.
select a.title from film a
inner join film_category b
on a.film_id=b.film_id
inner join category c
on b.category_id=c.category_id
where c.name = 'Family'
#7e.
select a.title, count(c.inventory_id) as 'Number of Rentals' from film a
inner join inventory b
on a.film_id=b.film_id
inner join rental c
on b.inventory_id=c.inventory_id
group by a.title
order by count(c.inventory_id) desc
#7f.
select a.store_id, sum(c.amount) as 'Store Revenue' from store a
inner join staff b
on a.manager_staff_id=b.staff_id
inner join payment c
on b.staff_id=c.staff_id
group by a.store_id
#7g.
select a.store_id, c.city, d.country from store a
inner join address b
on a.address_id=b.address_id
inner join city c
on b.city_id=c.city_id
inner join country d
on c.country_id=d.country_id
#7h.
select  a.name, sum(e.amount) as 'Total Amount' from category a
inner join film_category b
on a.category_id=b.category_id
inner join inventory c
on b.film_id=c.film_id
inner join rental d
on c.inventory_id=d.inventory_id
inner join payment e
on d.rental_id=e.rental_id
group by a.name
order by sum(e.amount) desc
limit 5
#8a.
select  a.name, sum(e.amount) as 'Total Amount' from category a
inner join film_category b
on a.category_id=b.category_id
inner join inventory c
on b.film_id=c.film_id
inner join rental d
on c.inventory_id=d.inventory_id
inner join payment e
on d.rental_id=e.rental_id
group by a.name
order by sum(e.amount) desc
limit 5
#8b.
select * from top_5_grossing_genres
#8c.
drop view top_5_grossing_genres		