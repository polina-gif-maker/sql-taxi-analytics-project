-- =========================================
-- 1. RETENTION RATE (УДЕРЖАНИЕ ПОЛЬЗОВАТЕЛЕЙ)
-- =========================================
-- Когортный анализ: считаем, какой % пользователей возвращается по месяцам

WITH cohorts AS (
    SELECT 
        user_id, 
        DATE_TRUNC('month', MIN(ride_date)) OVER (PARTITION BY user_id) AS cohort_month
    FROM rides
),
monthly_activity AS (
    SELECT 
        c.cohort_month,
        DATE_TRUNC('month', r.ride_date) AS activity_month,
        COUNT(DISTINCT r.user_id) AS active_users
    FROM cohorts c
    JOIN rides r ON c.user_id = r.user_id
    WHERE r.status = 'completed'
    GROUP BY 1, 2
)
SELECT 
    cohort_month,
    activity_month,
    active_users,
    ROUND(
        active_users::numeric / 
        FIRST_VALUE(active_users) OVER (PARTITION BY cohort_month ORDER BY activity_month) 
        * 100, 
    2) AS retention_pct
FROM monthly_activity
ORDER BY cohort_month, activity_month;


-- =========================================
-- 2. DRIVER EFFICIENCY (ЭФФЕКТИВНОСТЬ ВОДИТЕЛЕЙ)
-- =========================================
-- Находим водителей с наибольшей выручкой и считаем процент отмен

SELECT 
    driver_id,
    COUNT(ride_id) AS total_rides,
    SUM(fare_amount) AS total_revenue,
    AVG(fare_amount) AS avg_check,
    ROUND(
        SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END)::numeric 
        / COUNT(*) * 100, 
    2) AS cancel_rate
FROM rides
GROUP BY driver_id
HAVING COUNT(ride_id) > 10
ORDER BY total_revenue DESC
LIMIT 10;
