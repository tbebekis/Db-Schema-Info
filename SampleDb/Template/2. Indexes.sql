create index IDX_Actor_LastName on @OWNER_SCHEMA.actor     (last_name);
create index IDX_Customer_LastName on @OWNER_SCHEMA.customer  (last_name);
create index IDX_Inventory_Film on @OWNER_SCHEMA.inventory (store_id, film_id);