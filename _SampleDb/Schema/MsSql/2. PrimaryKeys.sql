alter table dbo.actor add constraint PK_Actor primary key (Id);

alter table dbo.address add constraint PK_Address primary key (Id);

alter table dbo.category add constraint PK_Category primary key (Id);

alter table dbo.city add constraint PK_City primary key (Id);

alter table dbo.country add constraint PK_Country primary key (Id);

alter table dbo.customer add constraint PK_Customer primary key (Id);

alter table dbo.film_actor add constraint PK_FilmActor primary key (actor_id, film_id);

alter table dbo.film_category add constraint PK_FilmCategory primary key (film_id, category_id);

alter table dbo.film add constraint PK_Film primary key (Id);

alter table dbo.inventory add constraint PK_Inventory primary key (Id);

alter table dbo.language add constraint PK_Language primary key (Id);

alter table dbo.payment add constraint PK_Payment primary key (Id);

alter table dbo.rental add constraint PK_Rental primary key (Id);

alter table dbo.staff add constraint PK_Staff primary key (Id);

alter table dbo.store add constraint PK_Store primary key (Id);