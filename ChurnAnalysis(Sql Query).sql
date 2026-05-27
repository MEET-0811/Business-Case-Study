 CREATE DATABASE:-
CREATE DATABASE ChurnAnalysis;

 INSERT DATA(.CSV):-
 FILE NAME
 CustomerSubscriptions_

-- PART 1 – SQL QUERIES

-- 1. Total number of active vs churned customers (by SubscriptionType):-

SELECT 
    SubscriptionType,
    SUM(CASE WHEN IsChurned = 0 THEN 1 ELSE 0 END) AS ActiveCustomers,
    SUM(CASE WHEN IsChurned = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers
FROM customersubscriptions_
GROUP BY SubscriptionType;

-- 2. Average FeedbackScore by SubscriptionType and Gender:-

SELECT 
    SubscriptionType,
    Gender,
    AVG(FeedbackScore) AS AvgFeedback
FROM customersubscriptions_
GROUP BY SubscriptionType, Gender;

-- 3.List customers who attended < 5 sessions AND gave feedback < 5:-

SELECT *
FROM customersubscriptions_
WHERE TotalSessions < 5
AND FeedbackScore < 5;

-- 4.Identify customers who haven’t logged in for the past 60 days:-
SELECT *
FROM customersubscriptions_
WHERE DATEDIFF(CURDATE(), LastLoginDate) > 60;

-- 5.Churn rate by SubscriptionType:-

SELECT 
    SubscriptionType,
    COUNT(*) AS TotalCustomers,
    SUM(IsChurned) AS ChurnedCustomers,
    (SUM(IsChurned) * 100.0 / COUNT(*)) AS ChurnRate
FROM CustomerSubscriptions_
GROUP BY SubscriptionType;

-- 6. List Top 10 customers with longest subscriptions (based on SubscriptionDate):-
SELECT *
FROM customersubscriptions_
ORDER BY SubscriptionDate ASC
LIMIT 10;

-- 7.Age group-wise churn analysis (e.g., 18–25, 26–35, etc.):-

SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        ELSE '36+'
    END AS AgeGroup,
    
    COUNT(*) AS TotalCustomers,
    SUM(IsChurned) AS ChurnedCustomers
FROM customersubscriptions_
GROUP BY AgeGroup;

