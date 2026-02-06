create database delivery_logistic ;
drop table delivery_logistics;
-- creating table 
CREATE TABLE delivery_logistics (
delivery_id VARCHAR(20) PRIMARY KEY,
delivery_partner VARCHAR(50),
vehicle_type VARCHAR(30),
delivery_mode VARCHAR(30),
region VARCHAR(30),
weather_condition VARCHAR(30),
distance_km DECIMAL(10,2),
package_weight_kg DECIMAL(10,2),
delivery_cost DECIMAL(12,2),
sla_expected_hours DECIMAL(6,2),
delivery_rating INT,
effective_speed_kmph DECIMAL(6,2),
weather_factor DECIMAL(4,2),
base_travel_time_hours DECIMAL(8,2),
actual_delivery_time_hours DECIMAL(8,2),
delay_hours DECIMAL(8,2),
sla_breach_flag INT,   -- 1 = breach, 0 = on time
cost_per_km DECIMAL(8,2),
weight_cost_ratio DECIMAL(10,2),
delay_bucket VARCHAR(30),
sla_breach VARCHAR(15),
cost_leakage_flag INT   -- 1 = leakage risk, 0 = normal
);
``

describe delivery_logistics;

SELECT 
    *
FROM
    delivery_logistics;
-- count totaldelivery
SELECT 
    COUNT(*) AS total_delivery
FROM
    delivery_logistics;
 -- count delayed delivery
 SELECT 
    COUNT(*) AS delayed_delivery
FROM
    delivery_logistics
WHERE
    sla_breach = 'Breach';
-- AVERAGE DELIVERY COST
SELECT 
    AVG(delivery_cost) AS avg_delivery_cost
FROM
    delivery_logistics;
-- delay % by partner
SELECT 
    delivery_partner,
    ROUND(100 * SUM(CASE
                WHEN sla_breach = 'Breach' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS delay_percentage
FROM
    delivery_logistics
GROUP BY delivery_partner
ORDER BY delay_percentage DESC;   
-- average delay by vehichle
SELECT 
    vehicle_type, ROUND(AVG(delay_hours), 2) AS avg_delay_hours
FROM
    delivery_logistics
GROUP BY vehicle_type
ORDER BY avg_delay_hours DESC;
-- Avg delay by region
SELECT 
    region, ROUND(AVG(delay_hours), 2) AS avg_delay_hours
FROM
    delivery_logistics
GROUP BY region
ORDER BY avg_delay_hours DESC;
-- weather as delay
SELECT 
    weather_condition, ROUND(AVG(delay_hours), 2) AS avg_delay_hours
FROM
    delivery_logistics
GROUP BY weather_condition
ORDER BY avg_delay_hours DESC;
-- top 5 delivery partner by cost per km
SELECT 
    delivery_partner,
    ROUND(AVG(distance_km / delivery_cost), 4) AS cost_per_km
FROM
    delivery_logistics
GROUP BY delivery_partner
ORDER BY cost_per_km desc limit 5;
--  
select * from delivery_logistics;
-- SLA breach by delivery mode
SELECT 
    delivery_mode,
    SUM(CASE
        WHEN sla_breach = 'Breach' THEN 1
        ELSE 0
    END) AS sla_breach
FROM
    delivery_logistics
GROUP BY delivery_mode;
-- Correlation proxy: rating vs delay
SELECT 
    delivery_rating, AVG(delay_hours)
FROM
    delivery_logistics
GROUP BY delivery_rating;
-- Estimated cost leakage
SELECT 
    SUM(delay_hours * 20)
FROM
    delivery_logistics;
 -- Delay Cost Leakage by Partner
 SELECT 
    delivery_partner,
    SUM(delay_hours) AS total_delay_hours,
    SUM(delay_hours * 20) AS estimated_cost_leakage
FROM
    delivery_logistics
WHERE
    delay_hours > 0
GROUP BY delivery_partner
ORDER BY estimated_cost_leakage DESC; 
 --    