alter table public.city add constraint FK_City_0 foreign key (country_id) references public.country(Id);


alter table public.customer add constraint FK_Customer_0 foreign key (store_id) references public.store(Id);
alter table public.customer add constraint FK_Customer_1 foreign key (address_id) references public.address(Id);

 
alter table public.film_actor add constraint FK_FilmActor_0 foreign key (film_id) references public.film(Id);


alter table public.film_category add constraint FK_FilmCategory_0 foreign key (film_id) references public.film(Id);
alter table public.film_category add constraint FK_FilmCategory_1 foreign key (category_id) references public.category(Id);


alter table public.film add constraint FK_Film_0 foreign key (language_id) references public.language(Id);
alter table public.film add constraint FK_Film_1 foreign key (original_language_id) references public.language(Id);


alter table public.inventory add constraint FK_Inventory_0 foreign key (film_id) references public.film(Id);
alter table public.inventory add constraint FK_Inventory_1 foreign key (store_id) references public.store(Id);


alter table public.payment add constraint FK_Payment_0 foreign key (customer_id) references public.customer(Id);
alter table public.payment add constraint FK_Payment_1 foreign key (staff_id) references public.staff(Id);
alter table public.payment add constraint FK_Payment_2 foreign key (rental_id) references public.rental(Id);


alter table public.rental add constraint FK_Rental_0 foreign key (inventory_id) references public.inventory(Id);
alter table public.rental add constraint FK_Rental_1 foreign key (customer_id) references public.customer(Id);
alter table public.rental add constraint FK_Rental_2 foreign key (staff_id) references public.staff(Id);

alter table public.staff add constraint FK_Staff_0 foreign key (store_id) references public.store(Id);
alter table public.staff add constraint FK_Staff_1 foreign key (address_id) references public.address(Id);


alter table public.store add constraint FK_Store_1 foreign key (manager_staff_id) references public.staff(Id);
alter table public.store add constraint FK_Store_0 foreign key (address_id) references public.address(Id);