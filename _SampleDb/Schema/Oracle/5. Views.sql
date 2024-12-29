create view dvd.customer_list_v as
select
  cu.customer_id                       as id,
  cu.last_name                         as last_name,
  cu.first_name                        as first_name,
  a.address                            as address,
  a.postal_code                        as zip_code,
  a.phone                              as phone,
  ci.city                              as city,
  co.country                           as country,
  case cu.active
    when 1 then 'active'
    else ''
  end                                  as notes,
  cu.store_id                          as sid
from
  dvd.customer     cu
  inner join dvd.address a  on cu.address_id = a.Id
  inner join dvd.city    ci on a.city_id     = ci.Id
  inner join dvd.country co on ci.country_id = co.Id;

create view dvd.film_list_v as
select
  f.film_id                          as fid,
  f.title                            as title,
  f.description                      as description,
  c.name                             as category,
  f.rental_rate                      as price,
  f.length                           as length,
  f.rating                           as rating,
  a.first_name                       as ActorFirstName,
  a.last_name                        as ActorLastName
from
  dvd.category                c
  left join dvd.film_category fc on fc.category_id = c.Id 
  left join dvd.film          f  on fc.film_id     = f.Id
  inner join dvd.film_actor   fa on fa.film_id     = f.Id  
  inner join dvd.actor        a  on fa.actor_id    = a.Id;

create view dvd.sales_by_film_category_v as
select
  c.name        as category,
  sum(p.amount) as total_sales
from
  dvd.payment            p
  inner join dvd.rental        r  on p.rental_id    = r.Id
  inner join dvd.inventory     i  on r.inventory_id = i.Id
  inner join dvd.film          f  on i.film_id      = f.Id
  inner join dvd.film_category fc on f.Id           = fc.film_id
  inner join dvd.category      c  on fc.category_id = c.Id
group by
  c.name;

create view dvd.sales_by_store_v as
select
  s.store_id                         as store_id,
  c.city                             as City,
  c.country                          as Country,
  m.first_name                       as ManagerFirstName,
  m.last_name                        as ManagerLastName,
  sum(p.amount)                      as total_sales
from
  dvd.payment        p
  inner join dvd.rental    r  on p.rental_id        = r.Id
  inner join dvd.inventory i  on r.inventory_id     = i.Id
  inner join dvd.store     s  on i.store_id         = s.Id
  inner join dvd.address   a  on s.address_id       = a.Id
  inner join dvd.city      c  on a.city_id          = c.Id
  inner join dvd.country   cy on c.Id               = cy.country_id
  inner join dvd.staff     m  on s.manager_staff_id = m.Id
group by
  s.store_id,
  cy.country,
  c.city,
  m.last_name,
  m.first_name;

create view dvd.staff_list_v as
select
  s.staff_id                         as id,
  s.last_name                        as last_name,
  s.first_name                       as first_name,
  a.address                          as address,
  a.postal_code                      as zip_code,
  a.phone                            as phone,
  ci.city                            as city,
  co.country                         as country,
  s.store_id                         as sid
from
  dvd.staff        s
  inner join dvd.address a  on s.address_id  = a.Id
  inner join dvd.city    ci on a.city_id     = ci.Id
  inner join dvd.country co on ci.country_id = co.Id;