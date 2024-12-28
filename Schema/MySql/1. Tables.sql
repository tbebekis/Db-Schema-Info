create table actor (
  Id          varchar(40) not null ,  
  first_name  varchar(45) not null ,
  last_name   varchar(45) not null ,
  last_update date default current_timestamp on update current_timestamp 
);


create table address (
  Id          varchar(40) not null ,  
  address     varchar(50)              not null ,
  address2    varchar(50) default null          ,
  district    varchar(20)              not null ,
  city_id     varchar(40) not null , 
  postal_code varchar(10) default null          ,
  phone       varchar(20)              not null ,
  last_update date  default current_timestamp on update current_timestamp 
);
 

create table category (
  Id          varchar(40) not null ,  
  name        varchar(25) not null ,
  last_update date  default current_timestamp on update current_timestamp 
);


create table city (
  Id          varchar(40) not null ,  
  city        varchar(50) not null ,
  country_id  varchar(40) not null ,  
  last_update date  default current_timestamp on update current_timestamp 
);


create table country (
  Id          varchar(40) not null ,  
  country     varchar(50) not null ,
  last_update date default current_timestamp on update current_timestamp 
);
 

create table customer (
  Id          varchar(40) not null ,  
  store_id    varchar(40) not null ,  
  first_name  varchar(45)              not null ,
  last_name   varchar(45)              not null ,
  email       varchar(50) default null          ,
  address_id  varchar(40) not null ,  
  active      integer       default 1    not null ,
  create_date date default current_timestamp, 
  last_update date default current_timestamp on update current_timestamp 
);


create table film_actor (
  actor_id    varchar(40) not null ,  
  film_id     varchar(40) not null ,  
  last_update date default current_timestamp on update current_timestamp 
);


create table film_category (
  film_id     varchar(40) not null ,  
  category_id varchar(40) not null ,  
  last_update date default current_timestamp on update current_timestamp 
);
 

create table film (
  Id                   varchar(40) not null ,  
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
  last_update          date default current_timestamp on update current_timestamp 
);
 

create table inventory (
  Id           varchar(40) not null ,  
  film_id      varchar(40) not null ,  
  store_id     varchar(40) not null ,  
  last_update  date default current_timestamp on update current_timestamp 
);
 

create table language (
  Id          varchar(40) not null ,  
  name        varchar(20) not null ,
  last_update date default current_timestamp on update current_timestamp 
);


create table payment (
  Id           varchar(40) not null ,  
  customer_id  varchar(40) not null ,  
  staff_id     varchar(40) not null ,  
  rental_id    varchar(40)     default null          ,
  amount       decimal(5,2)              not null ,
  payment_date date default current_timestamp  ,
  last_update  date default current_timestamp on update current_timestamp 
);


create table rental (
  Id              varchar(40) not null ,  
  rental_date     date default current_timestamp  ,
  inventory_id    varchar(40) not null ,       
  customer_id     varchar(40)              not null ,
  return_date     date    default null          ,
  staff_id        varchar(40)              not null ,
  last_update     date  default current_timestamp on update current_timestamp  
); 


create table staff (
  Id          varchar(40) not null ,  
  first_name  varchar(45)              not null ,
  last_name   varchar(45)              not null ,
  address_id  varchar(40)                        not null ,
  picture     blob              default null          ,
  email       varchar(50) default null          ,
  store_id    varchar(40)                        not null ,
  active      integer       default 1    not null ,
  username    varchar(16)              not null ,
  password    varchar(40) default null          ,
  last_update date  default current_timestamp on update current_timestamp   
);


create table store (
  Id               varchar(40) not null ,  
  manager_staff_id varchar(40) not null ,
  address_id       varchar(40) not null ,
  last_update      date default current_timestamp on update current_timestamp 
);