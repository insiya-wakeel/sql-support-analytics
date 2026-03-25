WITH ticket_analysis AS (
    SELECT 
        t.agent_id,
        a.agent_name,
        t.ticket_id,
        t.resolution_time_hours,
        s.sla_hours,

        CASE 
            WHEN t.status = 'Closed' 
                 AND t.resolution_time_hours > s.sla_hours THEN 1
            ELSE 0
        END AS sla_breach

    FROM tickets t
    JOIN agents a ON t.agent_id = a.agent_id
    JOIN sla_rules s ON t.priority = s.priority
),

agent_summary AS (
    SELECT 
        agent_name,
        COUNT(ticket_id) AS total_tickets,
        AVG(resolution_time_hours) AS avg_resolution_time,
        SUM(sla_breach) AS sla_breached,
        COUNT(ticket_id) - SUM(sla_breach) AS sla_met,
        ROUND(SUM(sla_breach) * 100.0 / COUNT(ticket_id), 2) AS breach_percent
    FROM ticket_analysis
    GROUP BY agent_name
)

SELECT *,
       RANK() OVER (ORDER BY breach_percent ASC) AS performance_rank
FROM agent_summary;