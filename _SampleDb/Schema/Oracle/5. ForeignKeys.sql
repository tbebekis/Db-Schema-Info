-- NOTE: this script should be executed after the data has been inserted

alter table DVD.customer add constraint FK_Customer_0 foreign key (store_id) references DVD.store(Id);
alter table DVD.customer add constraint FK_Customer_1 foreign key (address_id) references DVD.address(Id);

alter table DVD.inventory add constraint FK_Inventory_0 foreign key (film_id) references DVD.film(Id);
alter table DVD.inventory add constraint FK_Inventory_1 foreign key (store_id) references DVD.store(Id);

alter table DVD.payment add constraint FK_Payment_0 foreign key (customer_id) references DVD.customer(Id);
alter table DVD.payment add constraint FK_Payment_1 foreign key (staff_id) references DVD.staff(Id);
alter table DVD.payment add constraint FK_Payment_2 foreign key (rental_id) references DVD.rental(Id);

alter table DVD.rental add constraint FK_Rental_0 foreign key (inventory_id) references DVD.inventory(Id);
alter table DVD.rental add constraint FK_Rental_1 foreign key (customer_id) references DVD.customer(Id);
alter table DVD.rental add constraint FK_Rental_2 foreign key (staff_id) references DVD.staff(Id);

alter table DVD.staff add constraint FK_Staff_0 foreign key (store_id) references DVD.store(Id);
alter table DVD.staff add constraint FK_Staff_1 foreign key (address_id) references DVD.address(Id);

alter table DVD.store add constraint FK_Store_1 foreign key (manager_staff_id) references DVD.staff(Id);
alter table DVD.store add constraint FK_Store_0 foreign key (address_id) references DVD.address(Id);