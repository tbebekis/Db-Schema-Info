alter table @OWNER_SCHEMA.customer add constraint CHK_Customer_Active check  (active in (0,1));


alter table @OWNER_SCHEMA.film add constraint CHK_Film_Rating check (rating in ('G','PG','PG-13','R','NC-17'));
alter table @OWNER_SCHEMA.film add constraint CHK_Film_SpecialFeatures 
    check (special_features is null or
            special_features like '%Trailers%' or
            special_features like '%Commentaries%' or
            special_features like '%Deleted Scenes%' or 
            special_features like '%Behind the Scenes%');


alter table @OWNER_SCHEMA.staff add constraint CHK_Staff_Active check  (active in (0,1));


alter table @OWNER_SCHEMA.rental add constraint UC_Rental_0 unique (rental_date, inventory_id, customer_id);
 
 


 
 