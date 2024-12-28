create index IDX_Actor_LastName    on actor     (last_name);
create index IDX_Customer_LastName on customer  (last_name);
create index IDX_Inventory_Film    on inventory (store_id, film_id);