create table DVD.actor (
  Id          nvarchar2(40) not null primary key,
  first_name  nvarchar2(45) not null ,
  last_name   nvarchar2(45) not null ,
  last_update timestamp default current_timestamp 
);

create table DVD.address (
  Id          nvarchar2(40)  not null primary key,
  address     nvarchar2(50)              not null ,
  address2    nvarchar2(50) default null          ,
  district    nvarchar2(20)              not null ,
  city_id     nvarchar2(40) not null , 
  postal_code nvarchar2(10) default null          ,
  phone       nvarchar2(20)              not null ,
  last_update timestamp  default current_timestamp 
); 

create table DVD.category (
  Id          nvarchar2(40)  not null primary key,
  name        nvarchar2(25) not null ,
  last_update timestamp  default current_timestamp 
);

create table DVD.country (
  Id          nvarchar2(40)  not null primary key,
  country     nvarchar2(50) not null ,
  last_update timestamp default current_timestamp 
);

create table DVD.city (
  Id          nvarchar2(40)  not null primary key,
  city        nvarchar2(50) not null ,
  country_id  nvarchar2(40) not null ,  
  last_update timestamp  default current_timestamp,

  constraint FK_city_1 foreign key (country_id) references DVD.country (Id)   
);

create table DVD.language (
  Id          nvarchar2(40)  not null primary key,
  name        nvarchar2(20) not null ,
  last_update timestamp default current_timestamp 
);

create table DVD.film (
  Id                   nvarchar2(40)  not null primary key,
  title                nvarchar2(255)               not null ,
  description          nclob     default null           ,
  release_year         nvarchar2(40)   default null           ,
  language_id          nvarchar2(40) not null ,  
  original_language_id nvarchar2(40)            default null           ,
  rental_duration      integer            default 3     not null ,
  rental_rate          decimal(4,2)        default 4.99  not null ,
  length               integer            default null           ,
  replacement_cost     decimal(5,2)        default 19.99 not null ,
  rating               nvarchar2(10)  default 'G'            ,
  special_features     nvarchar2(100) default null           ,
  last_update          timestamp default current_timestamp ,

  constraint CH_film_1 check (rating in ('G','PG','PG-13','R','NC-17')),
  constraint CH_film_2 check (special_features is null or
            special_features like '%Trailers%' or
            special_features like '%Commentaries%' or
            special_features like '%Deleted Scenes%' or 
            special_features like '%Behind the Scenes%'),

  constraint FK_film_1 foreign key (language_id) references DVD.language (Id) ,
  constraint FK_film_2 foreign key (original_language_id) references DVD.language (Id)              
);

create table DVD.film_actor (
  actor_id    nvarchar2(40) not null ,  
  film_id     nvarchar2(40) not null ,  
  last_update timestamp default current_timestamp,

  constraint PK_film_actor primary key (actor_id, film_id),

  constraint FK_film_actor_1 foreign key (actor_id) references DVD.actor (Id) , 
  constraint FK_film_actor_2 foreign key (film_id) references DVD.film (Id)
);

create table DVD.film_category (
  film_id     nvarchar2(40) not null ,  
  category_id nvarchar2(40) not null ,  
  last_update timestamp default current_timestamp,

  constraint PK_film_category primary key (film_id, category_id),

  constraint FK_film_category_1 foreign key (film_id) references DVD.film (Id) ,
  constraint FK_film_category_2 foreign key (category_id) references DVD.category (Id) 
);

create table DVD.customer (
  Id          nvarchar2(40)  not null primary key,
  store_id    nvarchar2(40) not null ,  
  first_name  nvarchar2(45)              not null ,
  last_name   nvarchar2(45)              not null ,
  email       nvarchar2(50) default null          ,
  address_id  nvarchar2(40) not null ,  
  active      integer       default 1    not null ,
  create_date timestamp default current_timestamp, 
  last_update timestamp default current_timestamp,

  constraint CH_customer_1 check (active in (0,1))
);

create table DVD.inventory (
  Id           nvarchar2(40)  not null primary key,
  film_id      nvarchar2(40) not null ,  
  store_id     nvarchar2(40) not null ,  
  last_update  timestamp default current_timestamp 
);

create table DVD.payment (
  Id           nvarchar2(40)  not null primary key,
  customer_id  nvarchar2(40) not null ,  
  staff_id     nvarchar2(40) not null ,  
  rental_id    nvarchar2(40)     default null          ,
  amount       decimal(5,2)              not null ,
  payment_date timestamp default current_timestamp  ,
  last_update  timestamp default current_timestamp 
);

create table DVD.rental (
  Id              nvarchar2(40)  not null primary key,
  rental_date     timestamp default current_timestamp  ,
  inventory_id    nvarchar2(40) not null ,       
  customer_id     nvarchar2(40)              not null ,
  return_date     timestamp    default null          ,
  staff_id        nvarchar2(40)              not null ,
  last_update     timestamp  default current_timestamp ,  

  constraint UC_rental_1 unique (rental_date, inventory_id, customer_id)
); 

create table DVD.staff (
  Id          nvarchar2(40) not null primary key,
  first_name  nvarchar2(45)              not null ,
  last_name   nvarchar2(45)              not null ,
  address_id  nvarchar2(40)                        not null ,
  picture     blob              default null          ,
  email       nvarchar2(50) default null          ,
  store_id    nvarchar2(40)                        not null ,
  active      integer       default 1    not null ,
  username    nvarchar2(16)              not null ,
  password    nvarchar2(40) default null          ,
  last_update timestamp  default current_timestamp ,

  constraint CH_staff_1 check (active in (0,1)) 
);

create table DVD.store (
  Id               nvarchar2(40) not null primary key,
  manager_staff_id nvarchar2(40) not null ,
  address_id       nvarchar2(40) not null ,
  last_update      timestamp default current_timestamp     
);