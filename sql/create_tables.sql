-- Remove conflicting tables
DROP TABLE IF EXISTS accesssories CASCADE;
DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS equipments CASCADE;
DROP TABLE IF EXISTS guitars CASCADE;
DROP TABLE IF EXISTS teachers CASCADE;
DROP TABLE IF EXISTS the_company CASCADE;
DROP TABLE IF EXISTS the_guitar_courses CASCADE;
DROP TABLE IF EXISTS the_guitar_shops CASCADE;
DROP TABLE IF EXISTS worker CASCADE;
-- End of removing

CREATE TABLE accesssories (
    accessory_id SERIAL NOT NULL,
    shop_id INTEGER NOT NULL,
    accessory_price VARCHAR(256) NOT NULL
);
ALTER TABLE accesssories ADD CONSTRAINT pk_accesssories PRIMARY KEY (accessory_id);

CREATE TABLE clients (
    client_id SERIAL NOT NULL,
    course_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    client_name VARCHAR(256) NOT NULL,
    client_surname VARCHAR(256) NOT NULL,
    client_telephone_number VARCHAR(256) NOT NULL,
    client_age VARCHAR(256) NOT NULL
);
ALTER TABLE clients ADD CONSTRAINT pk_clients PRIMARY KEY (client_id);

CREATE TABLE customer (
    customer_id SERIAL NOT NULL,
    shop_id INTEGER NOT NULL,
    customer_name VARCHAR(256) NOT NULL,
    customer_surname VARCHAR(256) NOT NULL,
    customer_expense VARCHAR(256) NOT NULL
);
ALTER TABLE customer ADD CONSTRAINT pk_customer PRIMARY KEY (customer_id);

CREATE TABLE equipments (
    equipment_id SERIAL NOT NULL,
    course_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    equipment_price VARCHAR(256) NOT NULL
);
ALTER TABLE equipments ADD CONSTRAINT pk_equipments PRIMARY KEY (equipment_id);

CREATE TABLE guitars (
    guitar_id SERIAL NOT NULL,
    shop_id INTEGER NOT NULL,
    guitar_price VARCHAR(256) NOT NULL,
    guitar_type VARCHAR(256) NOT NULL,
    guitar_quality VARCHAR(256) NOT NULL,
    guitar_description VARCHAR(256) NOT NULL
);
ALTER TABLE guitars ADD CONSTRAINT pk_guitars PRIMARY KEY (guitar_id);

CREATE TABLE teachers (
    teacher_id SERIAL NOT NULL,
    course_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    teacher_name VARCHAR(256) NOT NULL,
    teacher_surname VARCHAR(256) NOT NULL,
    telephone_number VARCHAR(256) NOT NULL,
    teacher_addresss VARCHAR(256) NOT NULL
);
ALTER TABLE teachers ADD CONSTRAINT pk_teachers PRIMARY KEY (teacher_id);

CREATE TABLE the_company (
    company_id SERIAL NOT NULL,
    company_ceo VARCHAR(256) NOT NULL
);
ALTER TABLE the_company ADD CONSTRAINT pk_the_company PRIMARY KEY (company_id);

CREATE TABLE the_guitar_courses (
    course_id SERIAL NOT NULL,
    company_id INTEGER NOT NULL,
    schedule VARCHAR(256) NOT NULL,
    course_location VARCHAR(256) NOT NULL
);
ALTER TABLE the_guitar_courses ADD CONSTRAINT pk_the_guitar_courses PRIMARY KEY (course_id, company_id);

CREATE TABLE the_guitar_shops (
    shop_id SERIAL NOT NULL,
    company_id INTEGER NOT NULL,
    shop_location VARCHAR(256) NOT NULL
);
ALTER TABLE the_guitar_shops ADD CONSTRAINT pk_the_guitar_shops PRIMARY KEY (shop_id);

CREATE TABLE worker (
    worker_id SERIAL NOT NULL,
    shop_id INTEGER NOT NULL,
    worker_address VARCHAR(256) NOT NULL,
    worker_name VARCHAR(256) NOT NULL,
    worker_surname VARCHAR(256) NOT NULL,
    worker_telephonenumber VARCHAR(256) NOT NULL
);
ALTER TABLE worker ADD CONSTRAINT pk_worker PRIMARY KEY (worker_id);

ALTER TABLE accesssories ADD CONSTRAINT fk_accesssories_the_guitar_shop FOREIGN KEY (shop_id) REFERENCES the_guitar_shops (shop_id) ON DELETE CASCADE;

ALTER TABLE clients ADD CONSTRAINT fk_clients_the_guitar_courses FOREIGN KEY (course_id, company_id) REFERENCES the_guitar_courses (course_id, company_id) ON DELETE CASCADE;

ALTER TABLE customer ADD CONSTRAINT fk_customer_the_guitar_shops FOREIGN KEY (shop_id) REFERENCES the_guitar_shops (shop_id) ON DELETE CASCADE;

ALTER TABLE equipments ADD CONSTRAINT fk_equipments_the_guitar_course FOREIGN KEY (course_id, company_id) REFERENCES the_guitar_courses (course_id, company_id) ON DELETE CASCADE;

ALTER TABLE guitars ADD CONSTRAINT fk_guitars_the_guitar_shops FOREIGN KEY (shop_id) REFERENCES the_guitar_shops (shop_id) ON DELETE CASCADE;

ALTER TABLE teachers ADD CONSTRAINT fk_teachers_the_guitar_courses FOREIGN KEY (course_id, company_id) REFERENCES the_guitar_courses (course_id, company_id) ON DELETE CASCADE;

ALTER TABLE the_guitar_courses ADD CONSTRAINT fk_the_guitar_courses_the_compa FOREIGN KEY (company_id) REFERENCES the_company (company_id) ON DELETE CASCADE;

ALTER TABLE the_guitar_shops ADD CONSTRAINT fk_the_guitar_shops_the_company FOREIGN KEY (company_id) REFERENCES the_company (company_id) ON DELETE CASCADE;

ALTER TABLE worker ADD CONSTRAINT fk_worker_the_guitar_shops FOREIGN KEY (shop_id) REFERENCES the_guitar_shops (shop_id) ON DELETE CASCADE;
