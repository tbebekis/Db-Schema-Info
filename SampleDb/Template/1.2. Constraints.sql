ALTER TABLE @OWNER_SCHEMA.customer ADD CONSTRAINT CHK_Customer_Active CHECK  (active in (0,1));


ALTER TABLE @OWNER_SCHEMA.film ADD CONSTRAINT CHK_Film_Rating CHECK (rating in ('G','PG','PG-13','R','NC-17'));
ALTER TABLE @OWNER_SCHEMA.film ADD CONSTRAINT CHK_Film_SpecialFeatures 
    CHECK (special_features is null or
            special_features like '%Trailers%' or
            special_features like '%Commentaries%' or
            special_features like '%Deleted Scenes%' or 
            special_features like '%Behind the Scenes%');


ALTER TABLE @OWNER_SCHEMA.staff ADD CONSTRAINT CHK_Staff_Active CHECK  (active in (0,1));


ALTER TABLE @OWNER_SCHEMA.rental ADD CONSTRAINT UC_Rental_0 UNIQUE (rental_date, inventory_id, customer_id);
 
 


 
 