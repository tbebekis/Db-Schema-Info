alter table dvd.actor add constraint PK_Actor primary key (Id);

alter table dvd.address add constraint PK_Address primary key (Id);

alter table dvd.category add constraint PK_Category primary key (Id);

alter table dvd.city add constraint PK_City primary key (Id);

alter table dvd.country add constraint PK_Country primary key (Id);

alter table dvd.customer add constraint PK_Customer primary key (Id);

alter table dvd.film_actor add constraint PK_FilmActor primary key (actor_id, film_id);

alter table dvd.film_category add constraint PK_FilmCategory primary key (film_id, category_id);

alter table dvd.film add constraint PK_Film primary key (Id);

alter table dvd.inventory add constraint PK_Inventory primary key (Id);

alter table dvd.language add constraint PK_Language primary key (Id);

alter table dvd.payment add constraint PK_Payment primary key (Id);

alter table dvd.rental add constraint PK_Rental primary key (Id);

alter table dvd.staff add constraint PK_Staff primary key (Id);

alter table dvd.store add constraint PK_Store primary key (Id);