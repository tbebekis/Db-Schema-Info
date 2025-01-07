create function UpdateDate_actor() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger actor_BU before update on actor
   for each row execute procedure UpdateDate_actor();

create function UpdateDate_address() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger address_BU before update on address
   for each row execute procedure UpdateDate_address();

create function UpdateDate_category() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger category_BU before update on category
   for each row execute procedure UpdateDate_category();

create function UpdateDate_city() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger city_BU before update on city
   for each row execute procedure UpdateDate_city();

create function UpdateDate_country() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger country_BU before update on country
   for each row execute procedure UpdateDate_country();

create function UpdateDate_customer() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger customer_BU before update on customer
   for each row execute procedure UpdateDate_customer();

create function UpdateDate_film_actor() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger film_actor_BU before update on film_actor
   for each row execute procedure UpdateDate_film_actor();

create function UpdateDate_film_category() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger film_category_BU before update on film_category
   for each row execute procedure UpdateDate_film_category();

create function UpdateDate_film() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger film_BU before update on film
   for each row execute procedure UpdateDate_film();

create function UpdateDate_inventory() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger inventory_BU before update on inventory
   for each row execute procedure UpdateDate_inventory();

create function UpdateDate_language() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger language_BU before update on language
   for each row execute procedure UpdateDate_language();

create function UpdateDate_payment() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger payment_BU before update on payment
   for each row execute procedure UpdateDate_payment();

create function UpdateDate_rental() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger rental_BU before update on rental
   for each row execute procedure UpdateDate_rental();

create function UpdateDate_staff() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger staff_BU before update on staff
   for each row execute procedure UpdateDate_staff();

create function UpdateDate_store() returns trigger as
$$
begin
    NEW.last_update := current_timestamp;
    RETURN NEW;
end;
$$ language plpgsql ;

create trigger store_BU before update on store
   for each row execute procedure UpdateDate_store();

