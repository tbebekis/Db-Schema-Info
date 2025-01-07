SET TERM ^ ;

create trigger actor_BU active before update on actor as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger address_BU active before update on address as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger category_BU active before update on category as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger city_BU active before update on city as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger country_BU active before update on country as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger customer_BU active before update on customer as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger film_actor_BU active before update on film_actor as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger film_category_BU active before update on film_category as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger film_BU active before update on film as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger inventory_BU active before update on inventory as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger language_BU active before update on language as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger payment_BU active before update on payment as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger rental_BU active before update on rental as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger staff_BU active before update on staff as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

SET TERM ^ ;

create trigger store_BU active before update on store as
begin
    NEW.last_update = current_timestamp;
end^
 
SET TERM ; ^

