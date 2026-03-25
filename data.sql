/* =========================
   INSERT ALL DATA
   ========================= */

/* ---------- AGENTS ---------- */
INSERT INTO agents (agent_name, team, location, experience_years) VALUES
('Aisha Khan','L1 Support','Mumbai',2),
('Rohan Patil','L2 Support','Pune',4),
('Meera Shah','L1 Support','Bangalore',3),
('Karan Mehta','L3 Engineering','Hyderabad',6),
('Neha Verma','Network Team','Mumbai',5),
('Arjun Nair','L2 Support','Chennai',4),
('Sneha Iyer','Application Team','Bangalore',3),
('Vikram Joshi','Infra Team','Pune',5),
('Rahul Deshmukh','L1 Support','Pune',2),
('Priya Singh','Application Team','Delhi',3),
('Ankit Sharma','Infra Team','Mumbai',4),
('Divya Reddy','Network Team','Hyderabad',5);

/* ---------- CUSTOMERS ---------- */
INSERT INTO customers (customer_name, city, industry) VALUES
('ABC Corp','Mumbai','Finance'),
('Zenith Ltd','Pune','Manufacturing'),
('Delta Systems','Bangalore','IT'),
('Nova Tech','Delhi','E-commerce'),
('Orbit Solutions','Chennai','Healthcare'),
('Skyline Pvt Ltd','Mumbai','Retail'),
('FusionWorks','Hyderabad','IT'),
('GreenField Co','Pune','Agriculture'),
('NextGen Labs','Bangalore','Biotech'),
('UrbanCart','Delhi','E-commerce'),
('TechNova','Hyderabad','IT'),
('RetailHub','Mumbai','Retail'),
('MediCare Plus','Delhi','Healthcare'),
('AgroLife','Pune','Agriculture'),
('FinEdge','Bangalore','Finance');

/* ---------- SLA RULES ---------- */
INSERT INTO sla_rules (priority, sla_hours, severity_rank) VALUES
('P1', 2, 1),
('P2', 4, 2),
('High', 8, 3),
('Medium', 16, 4),
('Low', 24, 5);

/* ---------- TICKETS ---------- */
INSERT INTO tickets
(agent_id, customer_id, priority, status, category, source, created_date, resolved_date, resolution_time_hours, description)
VALUES

-- JAN
(1,1,'P1','Closed','Network','Call','2025-01-01','2025-01-01',2,'Outage'),
(2,2,'P2','Closed','Application','Email','2025-01-02','2025-01-03',20,'Login issue'),
(3,3,'High','Closed','Access','Portal','2025-01-03','2025-01-05',48,'Access request'),
(1,4,'Medium','Open','Hardware','Call','2025-01-04',NULL,NULL,'Laptop issue'),
(4,1,'Low','Closed','Software','Email','2025-01-05','2025-01-08',72,'Patch'),

(5,5,'High','Closed','Network','Call','2025-01-06','2025-01-07',18,'VPN slow'),
(2,3,'Medium','Closed','Application','Portal','2025-01-07','2025-01-10',60,'Crash'),
(3,2,'Low','Open','Access','Email','2025-01-08',NULL,NULL,'Reset'),
(1,1,'P2','Closed','Hardware','Call','2025-01-09','2025-01-09',4,'Printer'),
(4,4,'P1','Closed','Network','Portal','2025-01-10','2025-01-10',3,'Server'),

-- FEB
(2,5,'High','Closed','Application','Email','2025-02-01','2025-02-03',30,'Report'),
(5,3,'Medium','Open','Software','Portal','2025-02-02',NULL,NULL,'Update'),
(3,1,'Low','Closed','Access','Call','2025-02-03','2025-02-04',10,'Unlock'),
(1,2,'P1','Closed','Network','Call','2025-02-04','2025-02-04',2,'Firewall'),
(4,5,'P2','Closed','Hardware','Email','2025-02-05','2025-02-06',20,'Disk'),

(6,6,'High','Closed','Network','Portal','2025-02-06','2025-02-07',15,'Latency'),
(7,7,'Medium','Closed','Application','Call','2025-02-07','2025-02-09',40,'Bug'),
(8,8,'Low','Open','Access','Email','2025-02-08',NULL,NULL,'Credentials'),
(6,9,'P2','Closed','Hardware','Portal','2025-02-09','2025-02-10',6,'Device'),
(7,10,'P1','Closed','Network','Call','2025-02-10','2025-02-10',1,'Outage'),

-- MARCH
(1,3,'High','Closed','Application','Email','2025-03-01','2025-03-03',30,'Error'),
(2,4,'Medium','Closed','Software','Portal','2025-03-02','2025-03-05',70,'Update'),
(3,5,'Low','Open','Access','Call','2025-03-03',NULL,NULL,'Unlock'),
(4,6,'P1','Closed','Network','Call','2025-03-04','2025-03-04',2,'Crash'),
(5,7,'P2','Closed','Hardware','Email','2025-03-05','2025-03-06',18,'Replace'),

(6,8,'High','Closed','Application','Portal','2025-03-06','2025-03-08',45,'Failure'),
(7,9,'Medium','Open','Software','Email','2025-03-07',NULL,NULL,'Pending'),
(8,10,'Low','Closed','Access','Call','2025-03-08','2025-03-09',12,'Reset'),
(1,2,'P1','Closed','Network','Call','2025-03-09','2025-03-09',3,'Downtime'),
(2,1,'P2','Closed','Application','Portal','2025-03-10','2025-03-11',22,'Issue'),
-- APRIL
(9,11,'P1','Closed','Network','Call','2025-04-01','2025-04-01',2,'Outage'),
(10,12,'High','Closed','Application','Email','2025-04-02','2025-04-04',36,'Bug'),
(11,13,'Medium','Open','Hardware','Portal','2025-04-03',NULL,NULL,'Device issue'),
(12,14,'Low','Closed','Access','Call','2025-04-04','2025-04-05',12,'Reset'),
(9,15,'P2','Closed','Software','Email','2025-04-05','2025-04-06',20,'Update'),

(10,11,'High','Closed','Network','Portal','2025-04-06','2025-04-07',18,'Latency'),
(11,12,'Medium','Closed','Application','Call','2025-04-07','2025-04-09',40,'Crash'),
(12,13,'Low','Open','Access','Email','2025-04-08',NULL,NULL,'Unlock'),
(9,14,'P1','Closed','Hardware','Call','2025-04-09','2025-04-09',3,'Printer'),
(10,15,'P2','Closed','Network','Portal','2025-04-10','2025-04-11',22,'Downtime'),

-- MAY
(11,11,'High','Closed','Application','Email','2025-05-01','2025-05-03',30,'Failure'),
(12,12,'Medium','Closed','Software','Portal','2025-05-02','2025-05-05',70,'Upgrade'),
(9,13,'Low','Open','Access','Call','2025-05-03',NULL,NULL,'Reset'),
(10,14,'P1','Closed','Network','Call','2025-05-04','2025-05-04',2,'Crash'),
(11,15,'P2','Closed','Hardware','Email','2025-05-05','2025-05-06',18,'Replace'),

(12,11,'High','Closed','Application','Portal','2025-05-06','2025-05-08',45,'Issue'),
(9,12,'Medium','Open','Software','Email','2025-05-07',NULL,NULL,'Pending'),
(10,13,'Low','Closed','Access','Call','2025-05-08','2025-05-09',12,'Unlock'),
(11,14,'P1','Closed','Network','Call','2025-05-09','2025-05-09',3,'Outage'),
(12,15,'P2','Closed','Application','Portal','2025-05-10','2025-05-11',22,'Error'),

-- JUNE
(9,11,'High','Closed','Network','Email','2025-06-01','2025-06-02',20,'Latency'),
(10,12,'Medium','Closed','Application','Portal','2025-06-02','2025-06-04',40,'Crash'),
(11,13,'Low','Open','Access','Call','2025-06-03',NULL,NULL,'Reset'),
(12,14,'P1','Closed','Hardware','Call','2025-06-04','2025-06-04',2,'Failure'),
(9,15,'P2','Closed','Software','Email','2025-06-05','2025-06-06',18,'Update'),

(10,11,'High','Closed','Application','Portal','2025-06-06','2025-06-08',45,'Bug'),
(11,12,'Medium','Open','Software','Email','2025-06-07',NULL,NULL,'Pending'),
(12,13,'Low','Closed','Access','Call','2025-06-08','2025-06-09',12,'Unlock'),
(9,14,'P1','Closed','Network','Call','2025-06-09','2025-06-09',3,'Downtime'),
(10,15,'P2','Closed','Application','Portal','2025-06-10','2025-06-11',22,'Issue');