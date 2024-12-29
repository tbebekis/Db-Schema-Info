create table dvd.actor (
  Id          nvarchar2(40) not null ,  
  first_name  nvarchar2(45) not null ,
  last_name   nvarchar2(45) not null ,
  last_update date default sysdate 
);


create table dvd.address (
  Id          nvarchar2(40) not null ,  
  address     nvarchar2(50)              not null ,
  address2    nvarchar2(50) default null          ,
  district    nvarchar2(20)              not null ,
  city_id     nvarchar2(40) not null , 
  postal_code nvarchar2(10) default null          ,
  phone       nvarchar2(20)              not null ,
  last_update date  default sysdate 
);
 

create table dvd.category (
  Id          nvarchar2(40) not null ,  
  name        nvarchar2(25) not null ,
  last_update date  default sysdate 
);


create table dvd.city (
  Id          nvarchar2(40) not null ,  
  city        nvarchar2(50) not null ,
  country_id  nvarchar2(40) not null ,  
  last_update date  default sysdate 
);


create table dvd.country (
  Id          nvarchar2(40) not null ,  
  country     nvarchar2(50) not null ,
  last_update date default sysdate 
);
 

create table dvd.customer (
  Id          nvarchar2(40) not null ,  
  store_id    nvarchar2(40) not null ,  
  first_name  nvarchar2(45)              not null ,
  last_name   nvarchar2(45)              not null ,
  email       nvarchar2(50) default null          ,
  address_id  nvarchar2(40) not null ,  
  active      integer       default 1    not null ,
  create_date date default sysdate, 
  last_update date default sysdate 
);


create table dvd.film_actor (
  actor_id    nvarchar2(40) not null ,  
  film_id     nvarchar2(40) not null ,  
  last_update date default sysdate 
);


create table dvd.film_category (
  film_id     nvarchar2(40) not null ,  
  category_id nvarchar2(40) not null ,  
  last_update date default sysdate 
);
 

create table dvd.film (
  Id                   nvarchar2(40) not null ,  
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
  last_update          date default sysdate 
);
 

create table dvd.inventory (
  Id           nvarchar2(40) not null ,  
  film_id      nvarchar2(40) not null ,  
  store_id     nvarchar2(40) not null ,  
  last_update  date default sysdate 
);
 

create table dvd.language (
  Id          nvarchar2(40) not null ,  
  name        nvarchar2(20) not null ,
  last_update date default sysdate 
);


create table dvd.payment (
  Id           nvarchar2(40) not null ,  
  customer_id  nvarchar2(40) not null ,  
  staff_id     nvarchar2(40) not null ,  
  rental_id    nvarchar2(40)     default null          ,
  amount       decimal(5,2)              not null ,
  payment_date date default sysdate  ,
  last_update  date default sysdate 
);


create table dvd.rental (
  Id              nvarchar2(40) not null ,  
  rental_date     date default sysdate  ,
  inventory_id    nvarchar2(40) not null ,       
  customer_id     nvarchar2(40)              not null ,
  return_date     date    default null          ,
  staff_id        nvarchar2(40)              not null ,
  last_update     date  default sysdate  
); 


create table dvd.staff (
  Id          nvarchar2(40) not null ,  
  first_name  nvarchar2(45)              not null ,
  last_name   nvarchar2(45)              not null ,
  address_id  nvarchar2(40)                        not null ,
  picture     blob              default null          ,
  email       nvarchar2(50) default null          ,
  store_id    nvarchar2(40)                        not null ,
  active      integer       default 1    not null ,
  username    nvarchar2(16)              not null ,
  password    nvarchar2(40) default null          ,
  last_update date  default sysdate   
);


create table dvd.store (
  Id               nvarchar2(40) not null ,  
  manager_staff_id nvarchar2(40) not null ,
  address_id       nvarchar2(40) not null ,
  last_update      date default sysdate 
);