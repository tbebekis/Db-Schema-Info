-- NOTE: this script should be executed after the data has been inserted

alter table dbo.customer add constraint FK_Customer_0 foreign key (store_id) references dbo.store(Id);
alter table dbo.customer add constraint FK_Customer_1 foreign key (address_id) references dbo.address(Id);

alter table dbo.inventory add constraint FK_Inventory_0 foreign key (film_id) references dbo.film(Id);
alter table dbo.inventory add constraint FK_Inventory_1 foreign key (store_id) references dbo.store(Id);

alter table dbo.payment add constraint FK_Payment_0 foreign key (customer_id) references dbo.customer(Id);
alter table dbo.payment add constraint FK_Payment_1 foreign key (staff_id) references dbo.staff(Id);
alter table dbo.payment add constraint FK_Payment_2 foreign key (rental_id) references dbo.rental(Id);

alter table dbo.rental add constraint FK_Rental_0 foreign key (inventory_id) references dbo.inventory(Id);
alter table dbo.rental add constraint FK_Rental_1 foreign key (customer_id) references dbo.customer(Id);
alter table dbo.rental add constraint FK_Rental_2 foreign key (staff_id) references dbo.staff(Id);

alter table dbo.staff add constraint FK_Staff_0 foreign key (store_id) references dbo.store(Id);
alter table dbo.staff add constraint FK_Staff_1 foreign key (address_id) references dbo.address(Id);

alter table dbo.store add constraint FK_Store_1 foreign key (manager_staff_id) references dbo.staff(Id);
alter table dbo.store add constraint FK_Store_0 foreign key (address_id) references dbo.address(Id);