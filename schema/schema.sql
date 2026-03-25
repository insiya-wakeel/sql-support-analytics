/* =========================
   AGENTS TABLE
   ========================= */
CREATE TABLE agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    team VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    experience_years INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* =========================
   CUSTOMERS TABLE
   ========================= */
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    industry VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* =========================
   SLA RULES TABLE
   ========================= */
CREATE TABLE sla_rules (
    priority VARCHAR(20) PRIMARY KEY,
    sla_hours INT NOT NULL,
    severity_rank INT NOT NULL UNIQUE
);

/* =========================
   TICKETS TABLE
   ========================= */
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,

    agent_id INT NOT NULL,
    customer_id INT NOT NULL,

    priority VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL, -- Open, In Progress, Closed

    category VARCHAR(50) NOT NULL, -- Network, Application, etc.
    source VARCHAR(50), -- Email, Call, Portal

    created_date DATE NOT NULL,
    resolved_date DATE,

    resolution_time_hours INT, -- can be NULL for open tickets

    description TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (priority) REFERENCES sla_rules(priority)
);
