 

create view @OWNER_SCHEMA.customer_list_v as
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
  @OWNER_SCHEMA.customer     cu
  inner join @OWNER_SCHEMA.address a  on cu.address_id = a.address_id
  inner join @OWNER_SCHEMA.city    ci on a.city_id    = ci.city_id
  inner join @OWNER_SCHEMA.country co on ci.country_id = co.country_id;

create view @OWNER_SCHEMA.film_list_v as
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
  @OWNER_SCHEMA.category                c
  left join @OWNER_SCHEMA.film_category fc on c.category_id = fc.category_id
  left join @OWNER_SCHEMA.film          f  on fc.film_id    = f.film_id
  inner join @OWNER_SCHEMA.film_actor         fa on f.film_id     = fa.film_id
  inner join @OWNER_SCHEMA.actor              a  on fa.actor_id   = a.actor_id;

create view @OWNER_SCHEMA.sales_by_film_category_v as
select
  c.name        as category,
  sum(p.amount) as total_sales
from
  @OWNER_SCHEMA.payment            p
  inner join @OWNER_SCHEMA.rental        r  on p.rental_id    = r.rental_id
  inner join @OWNER_SCHEMA.inventory     i  on r.inventory_id = i.inventory_id
  inner join @OWNER_SCHEMA.film          f  on i.film_id      = f.film_id
  inner join @OWNER_SCHEMA.film_category fc on f.film_id      = fc.film_id
  inner join @OWNER_SCHEMA.category      c  on fc.category_id = c.category_id
group by
  c.name;

create view @OWNER_SCHEMA.sales_by_store_v as
select
  s.store_id                         as store_id,
  c.city                             as City,
  c.country                          as Country,
  m.first_name                       as ManagerFirstName,
  m.last_name                        as ManagerLastName,
  sum(p.amount)                      as total_sales
from
  @OWNER_SCHEMA.payment        p
  inner join @OWNER_SCHEMA.rental    r  on p.rental_id        = r.rental_id
  inner join @OWNER_SCHEMA.inventory i  on r.inventory_id     = i.inventory_id
  inner join @OWNER_SCHEMA.store     s  on i.store_id         = s.store_id
  inner join @OWNER_SCHEMA.address   a  on s.address_id       = a.address_id
  inner join @OWNER_SCHEMA.city      c  on a.city_id          = c.city_id
  inner join @OWNER_SCHEMA.country   cy on c.country_id       = cy.country_id
  inner join @OWNER_SCHEMA.staff     m  on s.manager_staff_id = m.staff_id
group by
  s.store_id,
  cy.country,
  c.city,
  m.last_name,
  m.first_name;

create view @OWNER_SCHEMA.staff_list_v as
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
  @OWNER_SCHEMA.staff        s
  inner join @OWNER_SCHEMA.address a  on s.address_id  = a.address_id
  inner join @OWNER_SCHEMA.city    ci on a.city_id     = ci.city_id
  inner join @OWNER_SCHEMA.country co on ci.country_id = co.country_id;        