-- NOTE: this script should be executed after the data has been inserted

alter table @OWNER_SCHEMA.customer add constraint FK_Customer_0 foreign key (store_id) references @OWNER_SCHEMA.store(Id);
alter table @OWNER_SCHEMA.customer add constraint FK_Customer_1 foreign key (address_id) references @OWNER_SCHEMA.address(Id);

alter table @OWNER_SCHEMA.inventory add constraint FK_Inventory_0 foreign key (film_id) references @OWNER_SCHEMA.film(Id);
alter table @OWNER_SCHEMA.inventory add constraint FK_Inventory_1 foreign key (store_id) references @OWNER_SCHEMA.store(Id);

alter table @OWNER_SCHEMA.payment add constraint FK_Payment_0 foreign key (customer_id) references @OWNER_SCHEMA.customer(Id);
alter table @OWNER_SCHEMA.payment add constraint FK_Payment_1 foreign key (staff_id) references @OWNER_SCHEMA.staff(Id);
alter table @OWNER_SCHEMA.payment add constraint FK_Payment_2 foreign key (rental_id) references @OWNER_SCHEMA.rental(Id);

alter table @OWNER_SCHEMA.rental add constraint FK_Rental_0 foreign key (inventory_id) references @OWNER_SCHEMA.inventory(Id);
alter table @OWNER_SCHEMA.rental add constraint FK_Rental_1 foreign key (customer_id) references @OWNER_SCHEMA.customer(Id);
alter table @OWNER_SCHEMA.rental add constraint FK_Rental_2 foreign key (staff_id) references @OWNER_SCHEMA.staff(Id);

alter table @OWNER_SCHEMA.staff add constraint FK_Staff_0 foreign key (store_id) references @OWNER_SCHEMA.store(Id);
alter table @OWNER_SCHEMA.staff add constraint FK_Staff_1 foreign key (address_id) references @OWNER_SCHEMA.address(Id);

alter table @OWNER_SCHEMA.store add constraint FK_Store_1 foreign key (manager_staff_id) references @OWNER_SCHEMA.staff(Id);
alter table @OWNER_SCHEMA.store add constraint FK_Store_0 foreign key (address_id) references @OWNER_SCHEMA.address(Id);