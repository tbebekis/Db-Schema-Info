alter table actor add constraint PK_Actor primary key (Id);

alter table address add constraint PK_Address primary key (Id);

alter table category add constraint PK_Category primary key (Id);

alter table city add constraint PK_City primary key (Id);

alter table country add constraint PK_Country primary key (Id);

alter table customer add constraint PK_Customer primary key (Id);

alter table film_actor add constraint PK_FilmActor primary key (actor_id, film_id);

alter table film_category add constraint PK_FilmCategory primary key (film_id, category_id);

alter table film add constraint PK_Film primary key (Id);

alter table inventory add constraint PK_Inventory primary key (Id);

alter table language add constraint PK_Language primary key (Id);

alter table payment add constraint PK_Payment primary key (Id);

alter table rental add constraint PK_Rental primary key (Id);

alter table staff add constraint PK_Staff primary key (Id);

alter table store add constraint PK_Store primary key (Id);