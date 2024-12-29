create view public.customer_list_v as
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
  public.customer     cu
  inner join public.address a  on cu.address_id = a.Id
  inner join public.city    ci on a.city_id     = ci.Id
  inner join public.country co on ci.country_id = co.Id;

create view public.film_list_v as
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
  public.category                c
  left join public.film_category fc on fc.category_id = c.Id 
  left join public.film          f  on fc.film_id     = f.Id
  inner join public.film_actor   fa on fa.film_id     = f.Id  
  inner join public.actor        a  on fa.actor_id    = a.Id;

create view public.sales_by_film_category_v as
select
  c.name        as category,
  sum(p.amount) as total_sales
from
  public.payment            p
  inner join public.rental        r  on p.rental_id    = r.Id
  inner join public.inventory     i  on r.inventory_id = i.Id
  inner join public.film          f  on i.film_id      = f.Id
  inner join public.film_category fc on f.Id           = fc.film_id
  inner join public.category      c  on fc.category_id = c.Id
group by
  c.name;

create view public.sales_by_store_v as
select
  s.store_id                         as store_id,
  c.city                             as City,
  c.country                          as Country,
  m.first_name                       as ManagerFirstName,
  m.last_name                        as ManagerLastName,
  sum(p.amount)                      as total_sales
from
  public.payment        p
  inner join public.rental    r  on p.rental_id        = r.Id
  inner join public.inventory i  on r.inventory_id     = i.Id
  inner join public.store     s  on i.store_id         = s.Id
  inner join public.address   a  on s.address_id       = a.Id
  inner join public.city      c  on a.city_id          = c.Id
  inner join public.country   cy on c.Id               = cy.country_id
  inner join public.staff     m  on s.manager_staff_id = m.Id
group by
  s.store_id,
  cy.country,
  c.city,
  m.last_name,
  m.first_name;

create view public.staff_list_v as
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
  public.staff        s
  inner join public.address a  on s.address_id  = a.Id
  inner join public.city    ci on a.city_id     = ci.Id
  inner join public.country co on ci.country_id = co.Id;