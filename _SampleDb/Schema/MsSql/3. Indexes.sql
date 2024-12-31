create index IDX_Actor_LastName    on dbo.actor     (last_name);
create index IDX_Customer_LastName on dbo.customer  (last_name);
create index IDX_Inventory_Film    on dbo.inventory (store_id, film_id);