WITH monthly_data AS (
    SELECT 
        DATE_FORMAT(t.created_date, '%Y-%m') AS report_month,
        COUNT(t.ticket_id) AS total_tickets,

        SUM(CASE 
                WHEN t.status = 'Closed' THEN 1 
                ELSE 0 
            END) AS resolved_tickets,

        SUM(CASE 
                WHEN t.status = 'Closed' 
                     AND t.resolution_time_hours > s.sla_hours THEN 1 
                ELSE 0 
            END) AS sla_breached_tickets

    FROM tickets t
    JOIN sla_rules s ON t.priority = s.priority
    GROUP BY report_month
),

final_output AS (
    SELECT 
        report_month,
        total_tickets,
        resolved_tickets,

        ROUND(sla_breached_tickets * 100.0 / total_tickets, 2) AS sla_breach_percent,

        LAG(total_tickets) OVER (ORDER BY report_month) AS previous_month_tickets

    FROM monthly_data
)

SELECT 
    report_month,
    total_tickets,
    resolved_tickets,
    sla_breach_percent,

    CASE 
        WHEN previous_month_tickets IS NULL THEN NULL
        ELSE ROUND(
            (total_tickets - previous_month_tickets) * 100.0 / previous_month_tickets, 
            2
        )
    END AS mom_ticket_change_percent

FROM final_output
ORDER BY report_month;