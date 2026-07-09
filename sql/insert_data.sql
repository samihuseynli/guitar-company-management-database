CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname = current_schema();

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;

-- and this is function usage:

select clean_tables();


-- function reset all sequences in your current schema



CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%' and table_schema=current_schema())
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;

-- and this is function usage:

select restart_sequences();

insert into The_company (company_id, company_ceo) values (1, 'Sami Huseynli');


insert into The_guitar_courses (course_id, schedule, course_location, company_id) values (1, 'monday, wednesday, friday', 'Prague 2', 1);
insert into The_guitar_courses (course_id, schedule, course_location, company_id) values (2, 'monday, wednesday, friday', 'Prague 1', 1);
insert into The_guitar_courses (course_id, schedule, course_location, company_id) values (3, 'tuesday, thursday, saturday', 'Prague 4', 1);
insert into The_guitar_courses (course_id, schedule, course_location, company_id) values (4, 'monday, wednesday, friday', 'Prague 6', 1);
insert into The_guitar_courses (course_id, schedule, course_location, company_id) values (5, 'tuesday, thursday, saturday', 'Prague 1', 1);

insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (1, 'Issi', 'Yemm', '+420 269 286 334', '49774 Jenifer Point', 4, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (2, 'Bette', 'Macoun', '+420 115 418 039', '486 Moland Plaza', 3, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (3, 'Liva', 'Layland', '+420 134 780 814', '60 Mcguire Way', 2, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (4, 'Marcella', 'Fadden', '+420 655 463 936', '61 Randy Junction', 5, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (5, 'Daisie', 'Perrygo', '+420 616 202 217', '9 Pleasure Way', 4, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (6, 'Merv', 'Torrese', '+420 629 714 355', '558 Quincy Terrace', 1, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (7, 'Sigismondo', 'Van der Beken', '+420 073 833 802', '3902 Eliot Circle', 3, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (8, 'Falkner', 'Habron', '+420 410 323 253', '23 Birchwood Lane', 2, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (9, 'Ulrick', 'Flann', '+420 829 985 855', '0 Florence Place', 2, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (10, 'Jackie', 'Fitzroy', '+420 039 127 550', '35649 Nova Pass', 4, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (11, 'Cobby', 'Kernley', '+420 889 579 775', '3 Ludington Trail', 1, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (12, 'Idette', 'Manson', '+420 512 773 108', '5 Lotheville Way', 3, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (13, 'Freida', 'Runnett', '+420 759 424 413', '24 Arkansas Junction', 2, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (14, 'Norine', 'Mellem', '+420 846 066 181', '3 Swallow Drive', 2, 1);
insert into Teachers (teacher_id, teacher_name, teacher_surname, telephone_number, teacher_addresss, course_id, company_id) values (15, 'Viki', 'Stelljes', '+420 472 181 903', '8 Kingsford Circle', 4, 1);


insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (1, 'Sylvan', 'Amis', '+420 378 381 549', 12, 1, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (2, 'Menard', 'Caunt', '+420 437 198 108', 19, 2, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (3, 'Lilli', 'Gionettitti', '+420 994 856 258', 12, 2, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (4, 'Joanie', 'De Roos', '+420 349 623 058', 20, 5, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (5, 'Cristina', 'Pepis', '+420 969 289 060', 12, 4, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (6, 'Timmy', 'Mersey', '+420 767 644 222', 17, 1, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (7, 'Renault', 'Quakley', '+420 926 573 970', 15, 2, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (8, 'Kiley', 'Deeming', '+420 761 772 859', 12, 4, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (9, 'Tansy', 'Yardy', '+420 176 166 805', 20, 2, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (10, 'Mareah', 'Lambot', '+420 431 089 032', 12, 3, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (11, 'Rowena', 'Goulbourne', '+420 381 094 236', 20, 5, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (12, 'Pancho', 'Carlick', '+420 272 945 675', 17, 5, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (13, 'Emery', 'Laingmaid', '+420 724 932 431', 14, 1, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (14, 'Clyve', 'Tremmil', '+420 401 526 993', 19, 4, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (15, 'Mariquilla', 'Primmer', '+420 399 393 485', 15, 5, 1);
insert into Clients (client_id, client_name, client_surname, client_telephone_number, client_age, course_id, company_id) values (16, 'John', 'Doe', '+420 399 393 415', 15, 5, 1);

insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (1, 20, 1, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (2, 120, 2, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (3, 20, 3, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (4, 50, 4, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (5, 80, 5, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (6, 45, 1, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (7, 155, 2, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (8, 300, 3, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (9, 30, 4, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (10, 95, 5, 1);
insert into Equipments (equipment_id, equipment_price, course_id, company_id) values (11, 25, 1, 1);

insert into The_guitar_shops (shop_id, shop_location, company_id) values (1, 'Prague 3', 1);
insert into The_guitar_shops (shop_id, shop_location, company_id) values (2, 'Prague 2', 1);
insert into The_guitar_shops (shop_id, shop_location, company_id) values (3, 'Prague 1', 1);

insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (1, 'Brandtr', 6252, 2, 'Madner');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (2, 'Way', 2358, 3, 'Drinkhall');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (3, 'Theresita', 10100, 2, 'Furnival');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (4, 'Puff', 9262, 2, 'Higgonet');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (5, 'Vivia', 5628, 2, 'Fenton');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (6, 'Sadie', 10328, 2, 'Coundley');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (7, 'Benyamin', 11888, 3, 'Noye');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (8, 'Winny', 10776, 2, 'McGaugie');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (9, 'Ami', 5570, 1, 'Andrelli');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (10, 'Enid', 9237, 2, 'Nutty');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (11, 'Nanny', 10156, 3, 'Benitti');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (12, 'Noe', 383, 2, 'Sayre');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (13, 'Rennie', 2661, 1, 'Ulrik');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (14, 'Carmina', 10208, 2, 'Roseburgh');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (15, 'Mohandis', 8535, 3, 'Crimmins');
insert into Customer (customer_id, customer_name, customer_expense, shop_id, customer_surname) values (16, 'John', 8535, 3, 'Doe');

insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (1, 'Milzie', '22532 Magdeline Hill', 3, 'Merioth', '+420 100 141 729');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (2, 'Franklin', '3 Nevada Crossing', 3, 'Thurbon', '+420 657 573 292');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (3, 'Pacorro', '72712 Lighthouse Bay Point', 1, 'Sergean', '+420 930 872 573');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (4, 'Cecilio', '3 Anthes Trail', 1, 'Bissatt', '+420 657 405 104');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (5, 'Quintus', '507 Stone Corner Court', 3, 'Safe', '+420 545 718 424');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (6, 'Trescha', '41 Shasta Parkway', 2, 'Stoller', '+420 915 761 101');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (7, 'Jerrine', '58527 Fair Oaks Parkway', 3, 'Sharrier', '+420 512 587 673');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (8, 'Constantino', '017 Schurz Way', 1, 'Hellmore', '+420 585 120 601');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (9, 'Page', '34210 Chive Junction', 1, 'Beldan', '+420 835 059 256');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (10, 'Thibaud', '2 Bartillon Place', 3, 'Grogono', '+420 453 203 211');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (11, 'Sabina', '12741 Gale Way', 1, 'Abbay', '+420 512 175 883');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (12, 'Stillman', '3 Algoma Terrace', 2, 'Croyser', '+420 875 055 162');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (13, 'Tootsie', '2550 Warbler Place', 2, 'MacEllen', '+420 584 513 875');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (14, 'Corey', '64 Evergreen Avenue', 1, 'Siehard', '+420 355 970 717');
insert into Worker (worker_id, worker_name, worker_address, shop_id, worker_surname, worker_telephonenumber) values (15, 'Quintina', '02 Meadow Valley Drive', 3, 'McIlraith', '+420 767 578 011');

insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (1, 1864, 2, 'bass', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (2, 707, 2, 'bass', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (3, 1931, 1, 'bass', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (4, 337, 1, 'bass', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (5, 575, 1, 'acoustic', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (6, 1241, 3, 'electric', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (7, 1712, 1, 'resonator', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (8, 1669, 2, 'classical', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (9, 871, 3, 'resonator', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (10, 408, 1, 'bass', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (11, 1687, 3, 'electric', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (12, 1915, 2, 'resonator', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (13, 794, 1, 'resonator', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (14, 1441, 3, 'electric', '0', '0');
insert into Guitars (guitar_id, guitar_price, shop_id, guitar_type, guitar_quality, guitar_description) values (15, 1126, 3, 'classical', '0', '0');

insert into Accesssories (accessory_id, accessory_price, shop_id) values (1, 155, 2);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (2, 272, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (3, 132, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (4, 183, 2);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (5, 244, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (6, 39, 3);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (7, 291, 3);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (8, 200, 3);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (9, 68, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (10, 122, 2);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (11, 288, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (12, 165, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (13, 221, 3);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (14, 200, 1);
insert into Accesssories (accessory_id, accessory_price, shop_id) values (15, 96, 3);
