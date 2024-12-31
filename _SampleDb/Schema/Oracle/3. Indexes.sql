create index IDX_Actor_LastName    on DVD.actor     (last_name);
create index IDX_Customer_LastName on DVD.customer  (last_name);
create index IDX_Inventory_Film    on DVD.inventory (store_id, film_id);