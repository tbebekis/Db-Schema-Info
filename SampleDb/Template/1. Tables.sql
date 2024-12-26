create table @OWNER_SCHEMA.actor (
  actor_id    @AUTO_INC,
  first_name  @NVARCHAR(45) not null ,
  last_name   @NVARCHAR(45) not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.address (
  address_id  @AUTO_INC,
  address     @NVARCHAR(50)              not null ,
  address2    @NVARCHAR(50) default null          ,
  district    @NVARCHAR(20)              not null ,
  city_id     integer                        not null ,
  postal_code @NVARCHAR(10) default null          ,
  phone       @NVARCHAR(20)              not null ,
  last_update @DATE  @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.category (
  category_id @AUTO_INC,
  name        @NVARCHAR(25) not null ,
  last_update @DATE  @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.city (
  city_id     @AUTO_INC,
  city        @NVARCHAR(50) not null ,
  country_id  integer           not null ,
  last_update @DATE  @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.country (
  country_id  @AUTO_INC,
  country     @NVARCHAR(50) not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.customer (
  customer_id @AUTO_INC,
  store_id    integer                        not null ,
  first_name  @NVARCHAR(45)              not null ,
  last_name   @NVARCHAR(45)              not null ,
  email       @NVARCHAR(50) default null          ,
  address_id  integer                        not null ,
  active      integer       default 1    not null ,
  create_date @DATE @DEFAULT_INSERT_DATE, 
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.film_actor (
  actor_id    integer not null ,
  film_id     integer not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.film_category (
  film_id     integer not null ,
  category_id integer not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.film (
  film_id              @AUTO_INC,
  title                @NVARCHAR(255)               not null ,
  description          @NBLOB_TEXT     default null           ,
  release_year         @NVARCHAR(4)   default null           ,
  language_id          integer                          not null ,
  original_language_id integer            default null           ,
  rental_duration      integer            default 3     not null ,
  rental_rate          @DECIMAL_(4,2)        default 4.99  not null ,
  length               integer            default null           ,
  replacement_cost     @DECIMAL_(5,2)        default 19.99 not null ,
  rating               @NVARCHAR(10)  default 'G'            ,
  special_features     @NVARCHAR(100) default null           ,
  last_update          @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.inventory (
  inventory_id @AUTO_INC,
  film_id      integer not null ,
  store_id     integer not null ,
  last_update  @DATE @DEFAULT_UPDATE_DATE 
);
 

create table @OWNER_SCHEMA.language (
  language_id @AUTO_INC,
  name        @NVARCHAR(20) not null ,
  last_update @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.payment (
  payment_id   @AUTO_INC,
  customer_id  integer                  not null ,
  staff_id     integer                  not null ,
  rental_id    integer     default null          ,
  amount       @DECIMAL_(5,2)              not null ,
  payment_date @DATE @DEFAULT_INSERT_DATE  ,
  last_update  @DATE @DEFAULT_UPDATE_DATE 
);


create table @OWNER_SCHEMA.rental (
  rental_id       @AUTO_INC,
  rental_date     @DATE @DEFAULT_INSERT_DATE  ,
  inventory_id    integer              not null ,
  customer_id     integer              not null ,
  return_date     @DATE    default null          ,
  staff_id        integer              not null ,
  last_update     @DATE  @DEFAULT_UPDATE_DATE  
); 


create table @OWNER_SCHEMA.staff (
  staff_id    @AUTO_INC,
  first_name  @NVARCHAR(45)              not null ,
  last_name   @NVARCHAR(45)              not null ,
  address_id  integer                        not null ,
  picture     blob              default null          ,
  email       @NVARCHAR(50) default null          ,
  store_id    integer                        not null ,
  active      integer       default 1    not null ,
  username    @NVARCHAR(16)              not null ,
  password    @NVARCHAR(40) default null          ,
  last_update @DATE  @DEFAULT_UPDATE_DATE   
);


create table @OWNER_SCHEMA.store (
  store_id         @AUTO_INC,
  manager_staff_id integer not null ,
  address_id       integer not null ,
  last_update      @DATE @DEFAULT_UPDATE_DATE 
);




