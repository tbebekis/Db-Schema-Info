alter table dvd.city add constraint FK_City_0 foreign key (country_id) references dvd.country(Id);


alter table dvd.customer add constraint FK_Customer_0 foreign key (store_id) references dvd.store(Id);
alter table dvd.customer add constraint FK_Customer_1 foreign key (address_id) references dvd.address(Id);

 
alter table dvd.film_actor add constraint FK_FilmActor_0 foreign key (film_id) references dvd.film(Id);


alter table dvd.film_category add constraint FK_FilmCategory_0 foreign key (film_id) references dvd.film(Id);
alter table dvd.film_category add constraint FK_FilmCategory_1 foreign key (category_id) references dvd.category(Id);


alter table dvd.film add constraint FK_Film_0 foreign key (language_id) references dvd.language(Id);
alter table dvd.film add constraint FK_Film_1 foreign key (original_language_id) references dvd.language(Id);


alter table dvd.inventory add constraint FK_Inventory_0 foreign key (film_id) references dvd.film(Id);
alter table dvd.inventory add constraint FK_Inventory_1 foreign key (store_id) references dvd.store(Id);


alter table dvd.payment add constraint FK_Payment_0 foreign key (customer_id) references dvd.customer(Id);
alter table dvd.payment add constraint FK_Payment_1 foreign key (staff_id) references dvd.staff(Id);
alter table dvd.payment add constraint FK_Payment_2 foreign key (rental_id) references dvd.rental(Id);


alter table dvd.rental add constraint FK_Rental_0 foreign key (inventory_id) references dvd.inventory(Id);
alter table dvd.rental add constraint FK_Rental_1 foreign key (customer_id) references dvd.customer(Id);
alter table dvd.rental add constraint FK_Rental_2 foreign key (staff_id) references dvd.staff(Id);

alter table dvd.staff add constraint FK_Staff_0 foreign key (store_id) references dvd.store(Id);
alter table dvd.staff add constraint FK_Staff_1 foreign key (address_id) references dvd.address(Id);


alter table dvd.store add constraint FK_Store_1 foreign key (manager_staff_id) references dvd.staff(Id);
alter table dvd.store add constraint FK_Store_0 foreign key (address_id) references dvd.address(Id);