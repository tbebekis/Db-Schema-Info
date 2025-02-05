create table actor (
  Id          varchar(40) not null primary key,
  first_name  varchar(45) not null ,
  last_name   varchar(45) not null ,
  last_update datetime default current_timestamp on update current_timestamp 
);

create table address (
  Id          varchar(40)  not null primary key,
  address     varchar(50)              not null ,
  address2    varchar(50) default null          ,
  district    varchar(20)              not null ,
  city_id     varchar(40) not null , 
  postal_code varchar(10) default null          ,
  phone       varchar(20)              not null ,
  last_update datetime  default current_timestamp on update current_timestamp 
); 

create table category (
  Id          varchar(40)  not null primary key,
  name        varchar(25) not null ,
  last_update datetime  default current_timestamp on update current_timestamp 
);

create table country (
  Id          varchar(40)  not null primary key,
  country     varchar(50) not null ,
  last_update datetime default current_timestamp on update current_timestamp 
);

create table city (
  Id          varchar(40)  not null primary key,
  city        varchar(50) not null ,
  country_id  varchar(40) not null ,  
  last_update datetime  default current_timestamp on update current_timestamp,

  constraint FK_city_1 foreign key (country_id) references country (Id)   
);

create table language (
  Id          varchar(40)  not null primary key,
  name        varchar(20) not null ,
  last_update datetime default current_timestamp on update current_timestamp 
);

create table film (
  Id                   varchar(40)  not null primary key,
  title                varchar(255)               not null ,
  description          longtext character set utf8mb4     default null           ,
  release_year         varchar(40)   default null           ,
  language_id          varchar(40) not null ,  
  original_language_id varchar(40)            default null           ,
  rental_duration      integer            default 3     not null ,
  rental_rate          decimal(4,2)        default 4.99  not null ,
  length               integer            default null           ,
  replacement_cost     decimal(5,2)        default 19.99 not null ,
  rating               varchar(10)  default 'G'            ,
  special_features     varchar(100) default null           ,
  last_update          datetime default current_timestamp on update current_timestamp ,

  constraint CH_film_1 check (rating in ('G','PG','PG-13','R','NC-17')),
  constraint CH_film_2 check (special_features is null or
            special_features like '%Trailers%' or
            special_features like '%Commentaries%' or
            special_features like '%Deleted Scenes%' or 
            special_features like '%Behind the Scenes%'),

  constraint FK_film_1 foreign key (language_id) references language (Id) ,
  constraint FK_film_2 foreign key (original_language_id) references language (Id)              
);

create table film_actor (
  actor_id    varchar(40) not null ,  
  film_id     varchar(40) not null ,  
  last_update datetime default current_timestamp on update current_timestamp,

  constraint PK_film_actor primary key (actor_id, film_id),

  constraint FK_film_actor_1 foreign key (actor_id) references actor (Id) , 
  constraint FK_film_actor_2 foreign key (film_id) references film (Id)
);

create table film_category (
  film_id     varchar(40) not null ,  
  category_id varchar(40) not null ,  
  last_update datetime default current_timestamp on update current_timestamp,

  constraint PK_film_category primary key (film_id, category_id),

  constraint FK_film_category_1 foreign key (film_id) references film (Id) ,
  constraint FK_film_category_2 foreign key (category_id) references category (Id) 
);

create table customer (
  Id          varchar(40)  not null primary key,
  store_id    varchar(40) not null ,  
  first_name  varchar(45)              not null ,
  last_name   varchar(45)              not null ,
  email       varchar(50) default null          ,
  address_id  varchar(40) not null ,  
  active      integer       default 1    not null ,
  create_date datetime default current_timestamp, 
  last_update datetime default current_timestamp on update current_timestamp,

  constraint CH_customer_1 check (active in (0,1))
);

create table inventory (
  Id           varchar(40)  not null primary key,
  film_id      varchar(40) not null ,  
  store_id     varchar(40) not null ,  
  last_update  datetime default current_timestamp on update current_timestamp 
);

create table payment (
  Id           varchar(40)  not null primary key,
  customer_id  varchar(40) not null ,  
  staff_id     varchar(40) not null ,  
  rental_id    varchar(40)     default null          ,
  amount       decimal(5,2)              not null ,
  payment_date datetime default current_timestamp  ,
  last_update  datetime default current_timestamp on update current_timestamp 
);

create table rental (
  Id              varchar(40)  not null primary key,
  rental_date     datetime default current_timestamp  ,
  inventory_id    varchar(40) not null ,       
  customer_id     varchar(40)              not null ,
  return_date     datetime    default null          ,
  staff_id        varchar(40)              not null ,
  last_update     datetime  default current_timestamp on update current_timestamp ,  

  constraint UC_rental_1 unique (rental_date, inventory_id, customer_id)
); 

create table staff (
  Id          varchar(40) not null primary key,
  first_name  varchar(45)              not null ,
  last_name   varchar(45)              not null ,
  address_id  varchar(40)                        not null ,
  picture     LONGBLOB       default null          ,
  email       varchar(50) default null          ,
  store_id    varchar(40)                        not null ,
  active      integer       default 1    not null ,
  username    varchar(16)              not null ,
  password    varchar(40) default null          ,
  last_update datetime  default current_timestamp on update current_timestamp ,

  constraint CH_staff_1 check (active in (0,1)) 
);

create table store (
  Id               varchar(40) not null primary key,
  manager_staff_id varchar(40) not null ,
  address_id       varchar(40) not null ,
  last_update      datetime default current_timestamp on update current_timestamp     
);