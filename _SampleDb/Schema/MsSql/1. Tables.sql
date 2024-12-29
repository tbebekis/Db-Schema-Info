create table dbo.actor (
  Id          nvarchar(40) not null ,  
  first_name  nvarchar(45) not null ,
  last_name   nvarchar(45) not null ,
  last_update date default getdate() 
);


create table dbo.address (
  Id          nvarchar(40) not null ,  
  address     nvarchar(50)              not null ,
  address2    nvarchar(50) default null          ,
  district    nvarchar(20)              not null ,
  city_id     nvarchar(40) not null , 
  postal_code nvarchar(10) default null          ,
  phone       nvarchar(20)              not null ,
  last_update date  default getdate() 
);
 

create table dbo.category (
  Id          nvarchar(40) not null ,  
  name        nvarchar(25) not null ,
  last_update date  default getdate() 
);


create table dbo.city (
  Id          nvarchar(40) not null ,  
  city        nvarchar(50) not null ,
  country_id  nvarchar(40) not null ,  
  last_update date  default getdate() 
);


create table dbo.country (
  Id          nvarchar(40) not null ,  
  country     nvarchar(50) not null ,
  last_update date default getdate() 
);
 

create table dbo.customer (
  Id          nvarchar(40) not null ,  
  store_id    nvarchar(40) not null ,  
  first_name  nvarchar(45)              not null ,
  last_name   nvarchar(45)              not null ,
  email       nvarchar(50) default null          ,
  address_id  nvarchar(40) not null ,  
  active      integer       default 1    not null ,
  create_date date default getdate(), 
  last_update date default getdate() 
);


create table dbo.film_actor (
  actor_id    nvarchar(40) not null ,  
  film_id     nvarchar(40) not null ,  
  last_update date default getdate() 
);


create table dbo.film_category (
  film_id     nvarchar(40) not null ,  
  category_id nvarchar(40) not null ,  
  last_update date default getdate() 
);
 

create table dbo.film (
  Id                   nvarchar(40) not null ,  
  title                nvarchar(255)               not null ,
  description          nvarchar(max)     default null           ,
  release_year         nvarchar(40)   default null           ,
  language_id          nvarchar(40) not null ,  
  original_language_id nvarchar(40)            default null           ,
  rental_duration      integer            default 3     not null ,
  rental_rate          decimal(4,2)        default 4.99  not null ,
  length               integer            default null           ,
  replacement_cost     decimal(5,2)        default 19.99 not null ,
  rating               nvarchar(10)  default 'G'            ,
  special_features     nvarchar(100) default null           ,
  last_update          date default getdate() 
);
 

create table dbo.inventory (
  Id           nvarchar(40) not null ,  
  film_id      nvarchar(40) not null ,  
  store_id     nvarchar(40) not null ,  
  last_update  date default getdate() 
);
 

create table dbo.language (
  Id          nvarchar(40) not null ,  
  name        nvarchar(20) not null ,
  last_update date default getdate() 
);


create table dbo.payment (
  Id           nvarchar(40) not null ,  
  customer_id  nvarchar(40) not null ,  
  staff_id     nvarchar(40) not null ,  
  rental_id    nvarchar(40)     default null          ,
  amount       decimal(5,2)              not null ,
  payment_date date default getdate()  ,
  last_update  date default getdate() 
);


create table dbo.rental (
  Id              nvarchar(40) not null ,  
  rental_date     date default getdate()  ,
  inventory_id    nvarchar(40) not null ,       
  customer_id     nvarchar(40)              not null ,
  return_date     date    default null          ,
  staff_id        nvarchar(40)              not null ,
  last_update     date  default getdate()  
); 


create table dbo.staff (
  Id          nvarchar(40) not null ,  
  first_name  nvarchar(45)              not null ,
  last_name   nvarchar(45)              not null ,
  address_id  nvarchar(40)                        not null ,
  picture     blob              default null          ,
  email       nvarchar(50) default null          ,
  store_id    nvarchar(40)                        not null ,
  active      integer       default 1    not null ,
  username    nvarchar(16)              not null ,
  password    nvarchar(40) default null          ,
  last_update date  default getdate()   
);


create table dbo.store (
  Id               nvarchar(40) not null ,  
  manager_staff_id nvarchar(40) not null ,
  address_id       nvarchar(40) not null ,
  last_update      date default getdate() 
);