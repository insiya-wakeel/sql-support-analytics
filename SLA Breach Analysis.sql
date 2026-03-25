WITH sla_check AS (
    SELECT 
        t.priority,
        t.ticket_id,
        t.status,
        t.resolution_time_hours,
        s.sla_hours,

        CASE 
            WHEN t.status = 'Closed' 
                 AND t.resolution_time_hours > s.sla_hours THEN 1
            ELSE 0
        END AS sla_breach

    FROM tickets t
    JOIN sla_rules s ON t.priority = s.priority
)

SELECT 
    priority,
    COUNT(ticket_id) AS total_tickets,
    SUM(sla_breach) AS breached_tickets,
    ROUND(SUM(sla_breach) * 100.0 / COUNT(ticket_id), 2) AS breach_percent
FROM sla_check
GROUP BY priority
ORDER BY breach_percent DESC;