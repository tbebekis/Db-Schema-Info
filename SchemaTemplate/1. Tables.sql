create table @OWNER_SCHEMA.actor (
  Id          @NVARCHAR(40) not null ,  
  first_name  @NVARCHAR(45) not null ,
  last_name   @NVARCHAR(45) not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.address (
  Id          @NVARCHAR(40) not null ,  
  address     @NVARCHAR(50)              not null ,
  address2    @NVARCHAR(50) default null          ,
  district    @NVARCHAR(20)              not null ,
  city_id     @NVARCHAR(40) not null , 
  postal_code @NVARCHAR(10) default null          ,
  phone       @NVARCHAR(20)              not null ,
  last_update @DATE  @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.category (
  Id          @NVARCHAR(40) not null ,  
  name        @NVARCHAR(25) not null ,
  last_update @DATE  @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.city (
  Id          @NVARCHAR(40) not null ,  
  city        @NVARCHAR(50) not null ,
  country_id  @NVARCHAR(40) not null ,  
  last_update @DATE  @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.country (
  Id          @NVARCHAR(40) not null ,  
  country     @NVARCHAR(50) not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.customer (
  Id          @NVARCHAR(40) not null ,  
  store_id    @NVARCHAR(40) not null ,  
  first_name  @NVARCHAR(45)              not null ,
  last_name   @NVARCHAR(45)              not null ,
  email       @NVARCHAR(50) default null          ,
  address_id  @NVARCHAR(40) not null ,  
  active      integer       default 1    not null ,
  create_date @DATE @DEFAULT_INSERT_DATE, 
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.film_actor (
  actor_id    @NVARCHAR(40) not null ,  
  film_id     @NVARCHAR(40) not null ,  
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.film_category (
  film_id     @NVARCHAR(40) not null ,  
  category_id @NVARCHAR(40) not null ,  
  last_update @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.film (
  Id                   @NVARCHAR(40) not null ,  
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
  last_update          @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.inventory (
  Id           @NVARCHAR(40) not null ,  
  film_id      @NVARCHAR(40) not null ,  
  store_id     @NVARCHAR(40) not null ,  
  last_update  @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.language (
  Id          @NVARCHAR(40) not null ,  
  name        @NVARCHAR(20) not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.payment (
  Id           @NVARCHAR(40) not null ,  
  customer_id  @NVARCHAR(40) not null ,  
  staff_id     @NVARCHAR(40) not null ,  
  rental_id    @NVARCHAR(40)     default null          ,
  amount       @DECIMAL_(5,2)              not null ,
  payment_date @DATE @DEFAULT_INSERT_DATE  ,
  last_update  @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.rental (
  Id              @NVARCHAR(40) not null ,  
  rental_date     @DATE @DEFAULT_INSERT_DATE  ,
  inventory_id    @NVARCHAR(40) not null ,       
  customer_id     @NVARCHAR(40)              not null ,
  return_date     @DATE    default null          ,
  staff_id        @NVARCHAR(40)              not null ,
  last_update     @DATE  @DEFAULT_UPDATE_DATE  
); 


create table @OWNER_SCHEMA.staff (
  Id          @NVARCHAR(40) not null ,  
  first_name  @NVARCHAR(45)              not null ,
  last_name   @NVARCHAR(45)              not null ,
  address_id  @NVARCHAR(40)                        not null ,
  picture     blob              default null          ,
  email       @NVARCHAR(50) default null          ,
  store_id    @NVARCHAR(40)                        not null ,
  active      integer       default 1    not null ,
  username    @NVARCHAR(16)              not null ,
  password    @NVARCHAR(40) default null          ,
  last_update @DATE  @DEFAULT_UPDATE_DATE   
);


create table @OWNER_SCHEMA.store (
  Id               @NVARCHAR(40) not null ,  
  manager_staff_id @NVARCHAR(40) not null ,
  address_id       @NVARCHAR(40) not null ,
  last_update      @DATE @DEFAULT_UPDATE_DATE 
);




