-- NOTE: this script should be executed after the data has been inserted

alter table customer add constraint FK_Customer_0 foreign key (store_id) references store(Id);
alter table customer add constraint FK_Customer_1 foreign key (address_id) references address(Id);

alter table inventory add constraint FK_Inventory_0 foreign key (film_id) references film(Id);
alter table inventory add constraint FK_Inventory_1 foreign key (store_id) references store(Id);

alter table payment add constraint FK_Payment_0 foreign key (customer_id) references customer(Id);
alter table payment add constraint FK_Payment_1 foreign key (staff_id) references staff(Id);
alter table payment add constraint FK_Payment_2 foreign key (rental_id) references rental(Id);

alter table rental add constraint FK_Rental_0 foreign key (inventory_id) references inventory(Id);
alter table rental add constraint FK_Rental_1 foreign key (customer_id) references customer(Id);
alter table rental add constraint FK_Rental_2 foreign key (staff_id) references staff(Id);

alter table staff add constraint FK_Staff_0 foreign key (store_id) references store(Id);
alter table staff add constraint FK_Staff_1 foreign key (address_id) references address(Id);

alter table store add constraint FK_Store_1 foreign key (manager_staff_id) references staff(Id);
alter table store add constraint FK_Store_0 foreign key (address_id) references address(Id);