alter table public.actor add constraint PK_Actor primary key (Id);

alter table public.address add constraint PK_Address primary key (Id);

alter table public.category add constraint PK_Category primary key (Id);

alter table public.city add constraint PK_City primary key (Id);

alter table public.country add constraint PK_Country primary key (Id);

alter table public.customer add constraint PK_Customer primary key (Id);

alter table public.film_actor add constraint PK_FilmActor primary key (actor_id, film_id);

alter table public.film_category add constraint PK_FilmCategory primary key (film_id, category_id);

alter table public.film add constraint PK_Film primary key (Id);

alter table public.inventory add constraint PK_Inventory primary key (Id);

alter table public.language add constraint PK_Language primary key (Id);

alter table public.payment add constraint PK_Payment primary key (Id);

alter table public.rental add constraint PK_Rental primary key (Id);

alter table public.staff add constraint PK_Staff primary key (Id);

alter table public.store add constraint PK_Store primary key (Id);