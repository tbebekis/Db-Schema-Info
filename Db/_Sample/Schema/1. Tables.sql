create table @OWNER_SCHEMA.actor (
  Id          @NVARCHAR(40) not null primary key,
  first_name  @NVARCHAR(45) not null ,
  last_name   @NVARCHAR(45) not null ,
  last_update @DATE_TIME @DEFAULT_UPDATE_DATE_TIME 
);

create table @OWNER_SCHEMA.address (
  Id          @NVARCHAR(40)  not null primary key,
  address     @NVARCHAR(50)              not null ,
  address2    @NVARCHAR(50) default null          ,
  district    @NVARCHAR(20)              not null ,
  city_id     @NVARCHAR(40) not null , 
  postal_code @NVARCHAR(10) default null          ,
  phone       @NVARCHAR(20)              not null ,
  last_update @DATE_TIME  @DEFAULT_UPDATE_DATE_TIME 
); 

create table @OWNER_SCHEMA.category (
  Id          @NVARCHAR(40)  not null primary key,
  name        @NVARCHAR(25) not null ,
  last_update @DATE_TIME  @DEFAULT_UPDATE_DATE_TIME 
);

create table @OWNER_SCHEMA.country (
  Id          @NVARCHAR(40)  not null primary key,
  country     @NVARCHAR(50) not null ,
  last_update @DATE_TIME @DEFAULT_UPDATE_DATE_TIME 
);

create table @OWNER_SCHEMA.city (
  Id          @NVARCHAR(40)  not null primary key,
  city        @NVARCHAR(50) not null ,
  country_id  @NVARCHAR(40) not null ,  
  last_update @DATE_TIME  @DEFAULT_UPDATE_DATE_TIME,

  constraint FK_city_1 foreign key (country_id) references @OWNER_SCHEMA.country (Id)   
);

create table @OWNER_SCHEMA.language (
  Id          @NVARCHAR(40)  not null primary key,
  name        @NVARCHAR(20) not null ,
  last_update @DATE_TIME @DEFAULT_UPDATE_DATE_TIME 
);

create table @OWNER_SCHEMA.film (
  Id                   @NVARCHAR(40)  not null primary key,
  title                @NVARCHAR(255)               not null ,
  description          @NBLOB_TEXT     default null           ,
  release_year         @NVARCHAR(40)   default null           ,
  language_id          @NVARCHAR(40) not null ,  
  original_language_id @NVARCHAR(40)            default null           ,
  rental_duration      integer            default 3     not null ,
  rental_rate          @DECIMAL_(4,2)        default 4.99  not null ,
  length               integer            default null           ,
  replacement_cost     @DECIMAL_(5,2)        default 19.99 not null ,
  rating               @NVARCHAR(10)  default 'G'            ,
  special_features     @NVARCHAR(100) default null           ,
  last_update          @DATE_TIME @DEFAULT_UPDATE_DATE_TIME ,

  constraint CH_film_1 check (rating in ('G','PG','PG-13','R','NC-17')),
  constraint CH_film_2 check (special_features is null or
            special_features like '%Trailers%' or
            special_features like '%Commentaries%' or
            special_features like '%Deleted Scenes%' or 
            special_features like '%Behind the Scenes%'),

  constraint FK_film_1 foreign key (language_id) references @OWNER_SCHEMA.language (Id) ,
  constraint FK_film_2 foreign key (original_language_id) references @OWNER_SCHEMA.language (Id)              
);

create table @OWNER_SCHEMA.film_actor (
  actor_id    @NVARCHAR(40) not null ,  
  film_id     @NVARCHAR(40) not null ,  
  last_update @DATE_TIME @DEFAULT_UPDATE_DATE_TIME,

  constraint PK_film_actor primary key (actor_id, film_id),

  constraint FK_film_actor_1 foreign key (actor_id) references @OWNER_SCHEMA.actor (Id) , 
  constraint FK_film_actor_2 foreign key (film_id) references @OWNER_SCHEMA.film (Id)
);

create table @OWNER_SCHEMA.film_category (
  film_id     @NVARCHAR(40) not null ,  
  category_id @NVARCHAR(40) not null ,  
  last_update @DATE_TIME @DEFAULT_UPDATE_DATE_TIME,

  constraint PK_film_category primary key (film_id, category_id),

  constraint FK_film_category_1 foreign key (film_id) references @OWNER_SCHEMA.film (Id) ,
  constraint FK_film_category_2 foreign key (category_id) references @OWNER_SCHEMA.category (Id) 
);

create table @OWNER_SCHEMA.customer (
  Id          @NVARCHAR(40)  not null primary key,
  store_id    @NVARCHAR(40) not null ,  
  first_name  @NVARCHAR(45)              not null ,
  last_name   @NVARCHAR(45)              not null ,
  email       @NVARCHAR(50) default null          ,
  address_id  @NVARCHAR(40) not null ,  
  active      integer       default 1    not null ,
  create_date @DATE_TIME @DEFAULT_INSERT_DATE_TIME, 
  last_update @DATE_TIME @DEFAULT_UPDATE_DATE_TIME,

  constraint CH_customer_1 check (active in (0,1))
);

create table @OWNER_SCHEMA.inventory (
  Id           @NVARCHAR(40)  not null primary key,
  film_id      @NVARCHAR(40) not null ,  
  store_id     @NVARCHAR(40) not null ,  
  last_update  @DATE_TIME @DEFAULT_UPDATE_DATE_TIME 
);

create table @OWNER_SCHEMA.payment (
  Id           @NVARCHAR(40)  not null primary key,
  customer_id  @NVARCHAR(40) not null ,  
  staff_id     @NVARCHAR(40) not null ,  
  rental_id    @NVARCHAR(40)     default null          ,
  amount       @DECIMAL_(5,2)              not null ,
  payment_date @DATE_TIME @DEFAULT_INSERT_DATE_TIME  ,
  last_update  @DATE_TIME @DEFAULT_UPDATE_DATE_TIME 
);

create table @OWNER_SCHEMA.rental (
  Id              @NVARCHAR(40)  not null primary key,
  rental_date     @DATE_TIME @DEFAULT_INSERT_DATE_TIME  ,
  inventory_id    @NVARCHAR(40) not null ,       
  customer_id     @NVARCHAR(40)              not null ,
  return_date     @DATE_TIME    default null          ,
  staff_id        @NVARCHAR(40)              not null ,
  last_update     @DATE_TIME  @DEFAULT_UPDATE_DATE_TIME ,  

  constraint UC_rental_1 unique (rental_date, inventory_id, customer_id)
); 

create table @OWNER_SCHEMA.staff (
  Id          @NVARCHAR(40) not null primary key,
  first_name  @NVARCHAR(45)              not null ,
  last_name   @NVARCHAR(45)              not null ,
  address_id  @NVARCHAR(40)                        not null ,
  picture     @BLOB       default null          ,
  email       @NVARCHAR(50) default null          ,
  store_id    @NVARCHAR(40)                        not null ,
  active      integer       default 1    not null ,
  username    @NVARCHAR(16)              not null ,
  password    @NVARCHAR(40) default null          ,
  last_update @DATE_TIME  @DEFAULT_UPDATE_DATE_TIME ,

  constraint CH_staff_1 check (active in (0,1)) 
);

create table @OWNER_SCHEMA.store (
  Id               @NVARCHAR(40) not null primary key,
  manager_staff_id @NVARCHAR(40) not null ,
  address_id       @NVARCHAR(40) not null ,
  last_update      @DATE_TIME @DEFAULT_UPDATE_DATE_TIME     
);



