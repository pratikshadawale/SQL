--1. How many organisations in total?

select
	count(org_name)
from
	organisations;

/* Result - 100
   Query Run time - 59ms */


--2. How many organisations do not have offer_requests?

select
	count(org.id)
from
	offer_requests req
join organisations org
on
	req.organisation_id = org.id
where
	req.organisation_id <> org.id
group by
	org.id;

/* Result - There is no such organization who have no offer_requests.
   Query Run time - 76ms */

--3. How many organisations have offer_requests?

select
	COUNT(org.id)
from
	offer_requests req
join organisations org
on
	req.organisation_id = org.id
group by
	org.id;

/* Result - All organization have no offer_requests.
   Query Run time -  */

--4. How many organisations have no offers?

select
	count(org.id)
from
	offers
join organisations org
on
	offers.organisation_id = org.id
where
	offers.organisation_id <> org.id
group by
	org.id;

/* Result - There is no such organization who have no offers.
   Query Run time - 169 */

--5. Which organisation has maximum offers and how many offers?

select
	max(org.org_name) organization,
	count(offers.id) max_no_of_offers
from
	organisations org
join offers on
	offers.organisation_id = org.id
group by
	org_name
order by
	count(offers.id) desc
limit 1;

/* Result -  moaning_turquoise has maximum offers and 10915 offers
   Query Run time - 189ms */

--6. Which organisation has minimum offers and how many offers?

select
	min(org.org_name) organization,
	count(offers.id) min_no_of_offers
from
	organisations org
join offers on
	offers.organisation_id = org.id
group by
	org_name
order by
	count(offers.id)
limit 1;

/* Result -  native_lime has minimum offers and 420 offers
   Query Run time - 220ms */


--7. Which organisation has maximum orders and how many orders?

select
	max(org.org_name) organisation,
	count(orders.id) max_no_of_orders 
from
	organisations org
join orders on
	orders.organisation_id = org.id
group by
	org_name
order by
	count(orders.id) desc
limit 1;

/* Result -  dual_sapphire has maximum 32 orders.
   Query Run time - 113ms */

--8. Which organisation has minimum orders and how many orders?

select
	min(org.org_name) organisation,
	count(orders.id) min_no_of_orders 
from
	organisations org
join orders on
	orders.organisation_id = org.id
group by
	org_name
order by
	count(orders.id)
limit 1;

/* Result -  hollow_amber has minimum 1 order.
   Query Run time - 88ms */


--9. Which organisation has the maximum total amount of offers and what is the amount?

select
	max(org.org_name) organisation,
	sum(offers.total_amount) as max_total_amt
from
	organisations org
join offers on
	offers.organisation_id = org.id
group by
	org_name
order by
	sum(offers.total_amount) desc
limit 1;

/* Result -  moaning_turquoise has maximum total amount of offers with 324,947,704 amount.
   Query Run time - 227ms */

--10. Which organisation has the maximum total amount of orders and what is the amount?

select
	min(org.org_name) organisation,
	sum(offers.total_amount) as min_total_amt
from
	organisations org
join offers on
	offers.organisation_id = org.id
group by
	org_name
order by
	sum(offers.total_amount)
limit 1;

/* Result -  lengthy_orange has minimum total amount of offers with 12,472,453 amount.
   Query Run time - 231ms */

