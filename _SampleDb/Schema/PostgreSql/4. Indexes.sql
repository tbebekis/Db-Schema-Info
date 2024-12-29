create index IDX_Actor_LastName    on public.actor     (last_name);
create index IDX_Customer_LastName on public.customer  (last_name);
create index IDX_Inventory_Film    on public.inventory (store_id, film_id);