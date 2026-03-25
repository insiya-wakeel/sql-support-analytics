WITH backlog_data AS (
    SELECT 
        t.ticket_id,
        a.agent_name,
        t.priority,
        t.created_date,
        DATEDIFF(CURDATE(), t.created_date) AS ticket_age_days
    FROM tickets t
    JOIN agents a ON t.agent_id = a.agent_id
    WHERE t.status != 'Closed'
)

SELECT 
    ticket_id,
    agent_name,
    priority,
    created_date,
    ticket_age_days,

    CASE 
        WHEN ticket_age_days <= 2 THEN 'Fresh'
        WHEN ticket_age_days BETWEEN 3 AND 5 THEN 'Moderate'
        WHEN ticket_age_days BETWEEN 6 AND 10 THEN 'Aging'
        ELSE 'Critical'
    END AS aging_bucket

FROM backlog_data
ORDER BY ticket_age_days DESC, priority;