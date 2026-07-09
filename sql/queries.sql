-- ----------------------------------------------------------
-- Query 1
-- Display each guitar course together with the number of
-- enrolled clients using a derived table.
-- ----------------------------------------------------------

SELECT
    gc.course_id,
    gc.company_id,
    gc.schedule,
    gc.course_location,
    client_counts.total_clients
FROM the_guitar_courses gc
JOIN (
    SELECT
        course_id,
        company_id,
        COUNT(client_id) AS total_clients
    FROM clients
    GROUP BY
        course_id,
        company_id
) AS client_counts
    ON gc.course_id = client_counts.course_id
   AND gc.company_id = client_counts.company_id;


-- ----------------------------------------------------------
-- Query 2
-- Display each guitar course together with the number of
-- enrolled clients using a correlated subquery.
-- ----------------------------------------------------------

SELECT
    gc.course_id,
    gc.company_id,
    gc.schedule,
    gc.course_location,
    (
        SELECT COUNT(*)
        FROM clients c
        WHERE c.course_id = gc.course_id
          AND c.company_id = gc.company_id
    ) AS total_clients
FROM the_guitar_courses gc;


-- ----------------------------------------------------------
-- Query 3
-- Calculate the average client age and number of clients
-- for each guitar course.
-- ----------------------------------------------------------

SELECT
    c.course_id,
    c.company_id,
    gc.schedule,
    gc.course_location,
    AVG(c.client_age::INT) AS avg_age,
    COUNT(c.client_id) AS num_clients
FROM clients c
JOIN the_guitar_courses gc
    ON c.course_id = gc.course_id
   AND c.company_id = gc.company_id
WHERE c.client_age IS NOT NULL
GROUP BY
    c.course_id,
    c.company_id,
    gc.schedule,
    gc.course_location
HAVING COUNT(c.client_id) > 1
ORDER BY avg_age DESC;


-- ----------------------------------------------------------
-- Query 4
-- Display customers whose shop contains all accessories
-- from the accessories table.
-- ----------------------------------------------------------

SELECT
    c.customer_name
FROM customer c
WHERE NOT EXISTS (
    SELECT
        a.accessory_id
    FROM accesssories a
    WHERE a.accessory_id NOT IN (
        SELECT
            a2.accessory_id
        FROM accesssories a2
        WHERE a2.shop_id = c.shop_id
    )
);


-- ----------------------------------------------------------
-- Query 5
-- Display clients who are enrolled only in course 2.
-- ----------------------------------------------------------

SELECT
    client_name
FROM clients
WHERE course_id = 2
  AND client_id NOT IN (
      SELECT
          client_id
      FROM clients
      WHERE course_id <> 2
  );


-- ----------------------------------------------------------
-- Query 6
-- Display teachers who are assigned to courses other than
-- course 1.
-- ----------------------------------------------------------

SELECT
    t.teacher_name
FROM teachers t
JOIN the_guitar_courses gc
    ON t.course_id = gc.course_id
WHERE gc.course_id <> 1;


-- ----------------------------------------------------------
-- Query 7
-- Display workers employed in guitar shop 2.
-- ----------------------------------------------------------

SELECT
    w.worker_name,
    w.worker_surname
FROM worker w
JOIN the_guitar_shops gs
    ON w.shop_id = gs.shop_id
WHERE gs.shop_id = 2;


-- ----------------------------------------------------------
-- Query 8
-- Display all guitars together with their corresponding shop
-- using a NATURAL JOIN.
-- ----------------------------------------------------------

SELECT *
FROM guitars
NATURAL JOIN the_guitar_shops;


-- ----------------------------------------------------------
-- Query 9
-- Display every teacher combined with every guitar course
-- using a CROSS JOIN.
-- ----------------------------------------------------------

SELECT *
FROM teachers
CROSS JOIN the_guitar_courses;


-- ----------------------------------------------------------
-- Query 10
-- Display clients together with their enrolled courses
-- using a LEFT OUTER JOIN.
-- ----------------------------------------------------------

SELECT
    clients.client_id,
    clients.client_name,
    clients.client_surname,
    the_guitar_courses.course_id,
    the_guitar_courses.schedule,
    the_guitar_courses.course_location
FROM clients
LEFT OUTER JOIN the_guitar_courses
    ON clients.course_id = the_guitar_courses.course_id
   AND clients.company_id = the_guitar_courses.company_id;


-- ----------------------------------------------------------
-- Query 11
-- Display all clients and all guitar courses using a
-- FULL OUTER JOIN.
-- ----------------------------------------------------------

SELECT
    clients.client_id,
    clients.client_name,
    clients.client_surname,
    the_guitar_courses.course_id,
    the_guitar_courses.schedule,
    the_guitar_courses.course_location
FROM clients
FULL OUTER JOIN the_guitar_courses
    ON clients.course_id = the_guitar_courses.course_id
   AND clients.company_id = the_guitar_courses.company_id;


-- ----------------------------------------------------------
-- Query 12
-- Display the names of all clients and customers without
-- duplicates.
-- ----------------------------------------------------------

SELECT
    client_name AS name,
    client_surname AS surname
FROM clients

UNION

SELECT
    customer_name AS name,
    customer_surname AS surname
FROM customer;


-- ----------------------------------------------------------
-- Query 13
-- Display people who appear both as clients and customers.
-- ----------------------------------------------------------

SELECT
    client_name AS name,
    client_surname AS surname
FROM clients

INTERSECT

SELECT
    customer_name AS name,
    customer_surname AS surname
FROM customer;


-- ----------------------------------------------------------
-- Query 14
-- Retrieve accessory IDs using the NOT IN approach.
-- ----------------------------------------------------------

SELECT
    accessory_id
FROM accesssories
WHERE shop_id NOT IN (
    SELECT
        shop_id
    FROM the_guitar_shops
    WHERE shop_id = 1
);


-- ----------------------------------------------------------
-- Query 15
-- Retrieve accessory IDs using the NOT EXISTS approach.
-- ----------------------------------------------------------

SELECT
    accessory_id
FROM accesssories a
WHERE NOT EXISTS (
    SELECT
        1
    FROM the_guitar_shops gs
    WHERE gs.shop_id = 1
      AND a.shop_id = gs.shop_id
);
