create trigger dbo.actor_BU on  dbo.actor after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.address_BU on  dbo.address after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.category_BU on  dbo.category after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.city_BU on  dbo.city after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.country_BU on  dbo.country after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.customer_BU on  dbo.customer after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.film_actor_BU on  dbo.film_actor after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.film_category_BU on  dbo.film_category after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.film_BU on  dbo.film after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.inventory_BU on  dbo.inventory after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.language_BU on  dbo.language after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.payment_BU on  dbo.payment after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.rental_BU on  dbo.rental after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.staff_BU on  dbo.staff after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

create trigger dbo.store_BU on  dbo.store after update as
begin
    IF @@ROWCOUNT = 0 
        RETURN;
end;

