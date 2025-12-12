CREATE TABLE client_master (
    client_id    INT PRIMARY KEY,
    client_name  VARCHAR(100),
    email        VARCHAR(100)
);

CREATE TABLE service_catalog (
    service_id    INT PRIMARY KEY,
    service_name  VARCHAR(100),
    hourly_rate   NUMERIC(10,2)
);

CREATE TABLE invoice_details (
    invoice_id        INT PRIMARY KEY,
    client_id         INT REFERENCES client_master(client_id),
    service_id        INT REFERENCES service_catalog(service_id),
    hours_worked      INT,
    discount_percent  INT,
    invoice_date      DATE
);

-- G1_23BCS10599_YASH KOTRA

INSERT INTO client_master (client_id, client_name, email) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com'),
(2, 'Anita Verma', 'anita@gmail.com'),
(3, 'Karan Singh', 'karan@gmail.com');

INSERT INTO service_catalog (service_id, service_name, hourly_rate) VALUES
(101, 'Web Development', 1200.00),
(102, 'Data Analysis',   1500.00),
(103, 'SEO Optimization', 800.00);

INSERT INTO invoice_details (invoice_id, client_id, service_id, hours_worked, discount_percent, invoice_date) VALUES
(1001, 1, 101, 10, 10, '2025-01-05'),
(1002, 2, 102,  8,  5, '2025-01-07'),
(1003, 3, 103, 12,  0, '2025-01-10');

-- quick check
SELECT * FROM client_master;
SELECT * FROM service_catalog;
SELECT * FROM invoice_details;


DROP VIEW IF EXISTS Employee_View;

CREATE VIEW Employee_View AS
SELECT 
    c.client_id      AS employee_id,
    c.client_name    AS employee_name,
    c.email
FROM 
    client_master c;

-- test the view
SELECT * FROM Employee_View;


DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'analyst'
    ) THEN
        CREATE ROLE Analyst;
    END IF;
END;
$$;

GRANT SELECT ON Employee_View TO Analyst;
-- G1_23BCS10599_YASH KOTRA