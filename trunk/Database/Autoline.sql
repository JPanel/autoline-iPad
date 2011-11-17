drop table DD_company;

drop table autoline_group;

drop table autoline_user;

drop table branch;

drop table city;

drop table code;

drop table color;

drop table contact;

drop table contact_status;

drop table customer;

drop table customer_status;

drop table customer_vehicle;

drop table department;

drop table executive;

drop table franchise;

drop table gender;

drop table model;

drop table opportunity;

drop table opportunity_status;

drop table origin;

drop table preferred_contact;

drop table province;

drop table replace_intention;

drop table source;

drop table strength;

drop table title;

drop table trade_type;

drop table transport_type;

drop table trim;

drop table variant;

drop table vehicle;

drop table weight;

create table DD_company (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table department (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table autoline_group (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
department_id        VARCHAR(36),
primary key (id),
foreign key (department_id)
      references department (id)
);

create table autoline_user (
id                   VARCHAR(36)                    not null,
password             VARCHAR(36)                    not null,
dealer_code          VARCHAR(36),
auto_login           INTEGER,
primary key (id)
);

create table branch (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table province (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table city (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
province_id          VARCHAR(36),
primary key (id),
foreign key (province_id)
      references province (id)
);

create table code (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
autoline_group_id    VARCHAR(36),
primary key (id),
foreign key (autoline_group_id)
      references autoline_group (id)
);

create table franchise (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table model (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
franchise_id         VARCHAR(36)                    not null,
primary key (id),
foreign key (franchise_id)
      references franchise (id)
);

create table variant (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
model_id             VARCHAR(36)                    not null,
primary key (id),
foreign key (model_id)
      references model (id)
);

create table color (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
variant_id           VARCHAR(36),
primary key (id),
foreign key (variant_id)
      references variant (id)
);

create table title (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table preferred_contact (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table source (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table customer_status (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table gender (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table transport_type (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table customer (
id                   INTEGER                        not null,
title_id             VARCHAR(36),
first_name           VARCHAR(60),
surname              VARCHAR(60),
short_name           VARCHAR(60),
company              VARCHAR(100),
salutation           VARCHAR(100),
home_phone           VARCHAR(60),
work_phone           VARCHAR(60),
work_extension       VARCHAR(60),
mobile_phone         VARCHAR(60),
fax                  VARCHAR(60),
email                VARCHAR(80),
preferred_contact_id VARCHAR(36),
address_province_id  VARCHAR(36),
address_city_id      VARCHAR(36),
address_detail       VARCHAR(300),
postcode             VARCHAR(10),
source_id            VARCHAR(36),
status_id            VARCHAR(36),
gender_id            VARCHAR(36),
birthday             DATE,
socialID             VARCHAR(60),
motability           VARCHAR(20),
transport_type_id    VARCHAR(36),
autoline_user_id     VARCHAR(36),
change_flag          INTEGER,
primary key (id),
foreign key (autoline_user_id)
      references autoline_user (id),
foreign key (title_id)
      references title (id),
foreign key (preferred_contact_id)
      references preferred_contact (id),
foreign key (address_province_id)
      references province (id),
foreign key (address_city_id)
      references city (id),
foreign key (source_id)
      references source (id),
foreign key (status_id)
      references customer_status (id),
foreign key (gender_id)
      references gender (id),
foreign key (transport_type_id)
      references transport_type (id)
);

create table executive (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table origin (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table strength (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table contact_status (
id                   INTEGER                        not null,
name                 VARCHAR(36),
primary key (id)
);

create table contact (
id                   INTEGER                        not null,
contact_date         DATE,
contact_time         TIME,
department_id        VARCHAR(36),
autoline_group_id    VARCHAR(36),
code_id              VARCHAR(36),
description          VARCHAR(300),
action               VARCHAR(100),
executive_id         VARCHAR(36),
branch_id            VARCHAR(36)                    not null,
origin_id            VARCHAR(36),
strength_id          VARCHAR(36),
completed_date       DATE,
completed_time       TIME,
completed_group_id   VARCHAR(36),
completed_code_id    VARCHAR(36),
status_id            INTEGER,
customer_id          INTEGER,
next_contact_id      VARCHAR(36),
change_flag          INTEGER,
primary key (id),
foreign key (customer_id)
      references customer (id),
foreign key (next_contact_id)
      references contact (id),
foreign key (department_id)
      references department (id),
foreign key (autoline_group_id)
      references autoline_group (id),
foreign key (code_id)
      references code (id),
foreign key (executive_id)
      references executive (id),
foreign key (branch_id)
      references branch (id),
foreign key (origin_id)
      references origin (id),
foreign key (strength_id)
      references strength (id),
foreign key (completed_group_id)
      references autoline_group (id),
foreign key (completed_code_id)
      references code (id),
foreign key (status_id)
      references contact_status (id)
);

create table trim (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
variant_id           VARCHAR(36),
primary key (id),
foreign key (variant_id)
      references variant (id)
);

create table vehicle (
id                   INTEGER                        not null,
chassis_number       VARCHAR(50),
registration         VARCHAR(36),
reg_date             DATE,
new_used             VARCHAR(2),
DD_company_id        VARCHAR(36)                    not null,
franchise_id         VARCHAR(36),
model_id             VARCHAR(36),
variant_id           VARCHAR(36),
description          VARCHAR(100),
brief_description    VARCHAR(100),
color_id             VARCHAR(36),
trim_id              VARCHAR(36),
model_year           DATE,
commercial           INTEGER,
mw_end_date          DATE,
primary key (id),
foreign key (DD_company_id)
      references DD_company (id),
foreign key (franchise_id)
      references franchise (id),
foreign key (model_id)
      references model (id),
foreign key (variant_id)
      references variant (id),
foreign key (color_id)
      references color (id),
foreign key (trim_id)
      references trim (id)
);

create table customer_vehicle (
vehicle_id           VARCHAR(36)                    not null,
customer_id          INTEGER                        not null,
primary key (vehicle_id, customer_id),
foreign key (customer_id)
      references customer (id),
foreign key (vehicle_id)
      references vehicle (id)
);

create table trade_type (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table replace_intention (
id                   VARCHAR(36)                    not null,
name                 VARCHAR(36),
primary key (id)
);

create table weight (
id                   INTEGER                        not null,
name                 VARCHAR(36),
primary key (id)
);

create table opportunity_status (
id                   INTEGER,
name                 VARCHAR(36)
);

create table opportunity (
id                   INTEGER                        not null,
intrested_in_id      VARCHAR(36),
preferred_model_id   VARCHAR(36),
preferred_variant_id VARCHAR(36),
intended_purchase_date DATE,
preferred_color_id   VARCHAR(36),
preferred_trim_id    VARCHAR(36),
weight_id            INTEGER,
status_id            INTEGER,
intended_trade_type_id VARCHAR(36),
owned_car_brand_id   VARCHAR(36),
own_car_model_id     VARCHAR(36),
purchase_year        DATE,
own_car_mileage      NUMERIC,
replace_intention_id VARCHAR(36),
reg_No               VARCHAR(36),
customer_id          INTEGER,
change_flag          INTEGER,
primary key (id),
foreign key (customer_id)
      references customer (id),
foreign key (intrested_in_id)
      references franchise (id),
foreign key (preferred_model_id)
      references model (id),
foreign key (preferred_variant_id)
      references variant (id),
foreign key (preferred_color_id)
      references color (id),
foreign key (intended_trade_type_id)
      references trade_type (id),
foreign key (preferred_trim_id)
      references trim (id),
foreign key (owned_car_brand_id)
      references franchise (id),
foreign key (own_car_model_id)
      references variant (id),
foreign key (replace_intention_id)
      references replace_intention (id),
foreign key (weight_id)
      references weight (id),
foreign key (status_id)
      references opportunity_status (id)
);

