create view customer_list_v as
select
  cu.Id                                as id,
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
  customer     cu
  inner join address a  on cu.address_id = a.Id
  inner join city    ci on a.city_id     = ci.Id
  inner join country co on ci.country_id = co.Id;

create view film_list_v as
select
  f.Id                               as fid,
  f.title                            as title,
  f.description                      as description,
  c.name                             as category,
  f.rental_rate                      as price,
  f.length                           as length,
  f.rating                           as rating,
  a.first_name                       as ActorFirstName,
  a.last_name                        as ActorLastName
from
  category                c
  left join film_category fc on fc.category_id = c.Id 
  left join film          f  on fc.film_id     = f.Id
  inner join film_actor   fa on fa.film_id     = f.Id  
  inner join actor        a  on fa.actor_id    = a.Id;

create view sales_by_film_category_v as
select
  c.name        as category,
  sum(p.amount) as total_sales
from
  payment            p
  inner join rental        r  on p.rental_id    = r.Id
  inner join inventory     i  on r.inventory_id = i.Id
  inner join film          f  on i.film_id      = f.Id
  inner join film_category fc on f.Id           = fc.film_id
  inner join category      c  on fc.category_id = c.Id
group by
  c.name;

create view sales_by_store_v as
select
  store.Id                              as store_id,
  city.city                             as City,
  country.country                       as Country,
  staff.first_name                      as ManagerFirstName,
  staff.last_name                       as ManagerLastName,
  sum(payment.amount)                   as total_sales
from
  payment   payment
  inner join rental    rental      on payment.rental_id        = rental.Id
  inner join inventory inventory   on rental.inventory_id      = inventory.Id
  inner join store     store       on inventory.store_id       = store.Id
  inner join address   address     on store.address_id         = address.Id
  inner join city      city        on address.city_id          = city.Id
  inner join country   country     on city.country_id          = country.Id
  inner join staff     staff       on store.manager_staff_id   = staff.Id
group by
  store.Id,
  country.country,
  city.city,
  staff.last_name,
  staff.first_name;

create view staff_list_v as
select
  s.Id                               as id,
  s.last_name                        as last_name,
  s.first_name                       as first_name,
  a.address                          as address,
  a.postal_code                      as zip_code,
  a.phone                            as phone,
  ci.city                            as city,
  co.country                         as country,
  s.store_id                         as sid
from
  staff        s
  inner join address a  on s.address_id  = a.Id
  inner join city    ci on a.city_id     = ci.Id
  inner join country co on ci.country_id = co.Id;