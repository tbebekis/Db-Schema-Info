 

alter table @OWNER_SCHEMA.actor add constraint PK_Actor primary key (Id);

alter table @OWNER_SCHEMA.address add constraint PK_Address primary key (Id);

alter table @OWNER_SCHEMA.category add constraint PK_Category primary key (Id);

alter table @OWNER_SCHEMA.city add constraint PK_City primary key (Id);

alter table @OWNER_SCHEMA.country add constraint PK_Country primary key (Id);

alter table @OWNER_SCHEMA.customer add constraint PK_Customer primary key (Id);

alter table @OWNER_SCHEMA.film_actor add constraint PK_FilmActor primary key (actor_id, film_id);

alter table @OWNER_SCHEMA.film_category add constraint PK_FilmCategory primary key (film_id, category_id);

alter table @OWNER_SCHEMA.film add constraint PK_Film primary key (Id);

alter table @OWNER_SCHEMA.inventory add constraint PK_Inventory primary key (Id);

alter table @OWNER_SCHEMA.language add constraint PK_Language primary key (Id);

alter table @OWNER_SCHEMA.payment add constraint PK_Payment primary key (Id);

alter table @OWNER_SCHEMA.rental add constraint PK_Rental primary key (Id);

alter table @OWNER_SCHEMA.staff add constraint PK_Staff primary key (Id);

alter table @OWNER_SCHEMA.store add constraint PK_Store primary key (Id);