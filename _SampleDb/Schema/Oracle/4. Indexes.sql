create index IDX_Actor_LastName    on dvd.actor     (last_name);
create index IDX_Customer_LastName on dvd.customer  (last_name);
create index IDX_Inventory_Film    on dvd.inventory (store_id, film_id);