create trigger actor_BU before update on actor for each row
begin
   update actor
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger address_BU before update on address for each row
begin
   update address
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger category_BU before update on category for each row
begin
   update category
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger city_BU before update on city for each row
begin
   update city
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger country_BU before update on country for each row
begin
   update country
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger customer_BU before update on customer for each row
begin
   update customer
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger film_actor_BU before update on film_actor for each row
begin
   update film_actor
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger film_category_BU before update on film_category for each row
begin
   update film_category
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger film_BU before update on film for each row
begin
   update film
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger inventory_BU before update on inventory for each row
begin
   update inventory
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger language_BU before update on language for each row
begin
   update language
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger payment_BU before update on payment for each row
begin
   update payment
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger rental_BU before update on rental for each row
begin
   update rental
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger staff_BU before update on staff for each row
begin
   update staff
   set last_update = current_date
   where rowid = new.rowid ;
end;

create trigger store_BU before update on store for each row
begin
   update store
   set last_update = current_date
   where rowid = new.rowid ;
end;

