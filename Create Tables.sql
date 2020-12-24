
create table category(category_id Varchar2(250) not null unique,available_items Varchar2(250),category_type Varchar2(250));

create table employee(emp_id Varchar2(250) not null unique,emp_name Varchar2(250),emp_age Varchar2(250),DOB Varchar2(250),emp_address Varchar2(250),emp_phone_no Varchar2(250),emp_joining_date Varchar2(250));

create table supplier(supplier_Id Varchar2(250) not null unique,supplier_name Varchar2(250),phone_no Varchar2(250),province Varchar2(250),city Varchar2(250),street Varchar2(250));

create table customer(customer_Id Varchar2(250) not null unique,customer_name Varchar2(250),customer_phone_no Varchar2(250),customer_address Varchar2(250));


create table product(prod_id varchar2(250),prod_name varchar2(250),exp_date varchar2(250),manufacture_date varchar2(250),category_id varchar2(250));
alter table product add constraints pk_prod_id PRIMARY KEY(prod_id);
alter table product add constraints fk_category_id Foreign key (category_id)
  references category(category_id);


create table shipper(shipper_id varchar2(250),phone_no varchar2(250), varchar2(250),shipper_name varchar2(250),emp_id varchar2(250));
alter table shipper add constraints pk_shipper_id PRIMARY KEY(shipper_id);
alter table shipper add constraints fk_emp_id Foreign key (emp_id)
  references employee(emp_id);


create table shipment(shipment_no varchar2(250),shipment_date varchar2(250),shipment_type varchar2(250),shipper_id varchar2(250));
alter table shipment add constraints pk_shipment_id PRIMARY KEY(shipment_no);
alter table shipment add constraints fk_shipper_id Foreign key (shipper_id)
  references shipper(shipper_id);


create table orders(order_no varchar2(250),order_date varchar2(250),supplier_id varchar2(250),shipment_no varchar2(250));
alter table orders add constraints pk_order_no PRIMARY KEY(order_no);
alter table orders add constraints fk_supplier_id Foreign key (supplier_id)
  references supplier(supplier_id);
alter table orders add constraints fk_shipment_no Foreign key (shipment_no)
  references shipment(shipment_no);  

create table place_order(order_no varchar2(250),prod_id varchar2(250),customer_Id varchar2(250));
ALTER TABLE place_order ADD CONSTRAINT pk_place_order_no PRIMARY KEY (order_no, prod_id,customer_Id);
ALTER TABLE place_order ADD CONSTRAINT Fk_place_order_no FOREIGN KEY (order_no) REFERENCES orders (order_no);
ALTER TABLE place_order ADD CONSTRAINT Fk2_place_order_no FOREIGN KEY (customer_Id) REFERENCES customer(customer_Id);
ALTER TABLE place_order ADD CONSTRAINT Fk3_place_order_no FOREIGN KEY (prod_id) REFERENCES product(prod_id);

