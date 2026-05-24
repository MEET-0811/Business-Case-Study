# 📊 Analyzing Churn Risk in Subscription-Based Services”

## 📌 Project Overview

The Analyzing Churn Risk in Subscription-Based Services” Dashboard is a Power BI project developed to analyze customer subscription behavior and identify churn patterns in a gym membership system. The project helps businesses understand customer engagement, monitor inactive users, and improve retention strategies through interactive visualizations and KPI tracking.

The project uses SQL and CSV datasets integrated into Power BI to create a modern and professional analytics dashboard.

---

# 🎯 Project Objectives

- Analyze customer churn behavior
- Identify inactive customers
- Track customer engagement levels
- Compare churn across subscription plans
- Improve customer retention strategies
- Create interactive business insights using Power BI

---

# 🛠 Tools & Technologies Used

| Tool | Purpose |
|------|---------|
| Power BI | Dashboard & Visualization |
| MySQL | Database Management |
| SQL | Data Querying |
| CSV | Data Source |
| DAX | KPI & Calculations |

---

# 📂 Dataset Description

The dataset contains gym membership customer details.

## Dataset Columns

| Column Name | Description |
|-------------|-------------|
| CustomerID | Unique customer ID |
| Name | Customer name |
| Age | Customer age |
| Gender | Male/Female |
| SubscriptionType | Monthly/Quarterly/Yearly |
| SubscriptionDate | Membership start date |
| LastLoginDate | Last activity date |
| TotalSessions | Gym/Yoga/Consultation sessions |
| FeedbackScore | Customer feedback rating |
| IsChurned | Customer churn status |

---

# 🗄 SQL Database Creation

## Create Database

```sql
CREATE DATABASE ChurnAnalysis;
USE ChurnAnalysis;
```

---

# 🧱 Create Table

```sql
CREATE TABLE CustomerSubscriptions_ (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(20),
    SubscriptionType VARCHAR(20),
    SubscriptionDate DATE,
    LastLoginDate DATE,
    TotalSessions VARCHAR(50),
    FeedbackScore INT,
    IsChurned INT
);
```

---

# 📥 Sample Data Insert

```sql
INSERT INTO CustomerSubscriptions_
(CustomerID, Name, Age, Gender, SubscriptionType, SubscriptionDate, LastLoginDate, TotalSessions, FeedbackScore, IsChurned)
VALUES
(1,'Rahul',22,'Male','Monthly','2025-01-10','2025-05-01','Yoga - 15',4,1),
(2,'Priya',28,'Female','Yearly','2024-08-15','2025-05-20','Gym - 40',9,0),
(3,'Aman',19,'Male','Monthly','2025-02-01','2025-03-01','Consultation - 2',3,1);
```

---

# 🔎 SQL Queries Used

## 1. Total number of active vs churned customers (by SubscriptionType):-
```sql
SELECT 
SUM(CASE WHEN IsChurned = 0 THEN 1 ELSE 0 END) AS ActiveCustomers,
SUM(CASE WHEN IsChurned = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers
FROM CustomerSubscriptions_;
```
<img width="1366" height="721" alt="image" src="https://github.com/user-attachments/assets/b192eb00-a662-4c92-a552-88f3ea2bf0ff" />

## 2. Average FeedbackScore by SubscriptionType and Gender:-

```sql
SELECT 
    SubscriptionType,
    Gender,
    AVG(FeedbackScore) AS AvgFeedback
FROM customersubscriptions_
GROUP BY SubscriptionType, Gender;
```
<img width="1366" height="721" alt="image" src="https://github.com/user-attachments/assets/dbf4c273-5918-4475-9a55-4f9173f26220" />

## 3. List customers who attended < 5 sessions AND gave feedback < 5:-

```sql
SELECT *
FROM customersubscriptions_
WHERE TotalSessions < 5
AND FeedbackScore < 5;
```
<img width="1362" height="725" alt="image" src="https://github.com/user-attachments/assets/3dd3f174-edc0-4336-a195-4ceff92574ac" />

## 4.Identify customers who haven’t logged in for the past 60 days:-

```sql
SELECT *
FROM customersubscriptions_
WHERE DATEDIFF(CURDATE(), LastLoginDate) > 60;
```
<img width="1353" height="725" alt="image" src="https://github.com/user-attachments/assets/3314e333-6721-42a0-95e6-bc9d4381848d" />

## 5. Churn Rate by Subscription Type

```sql
SELECT 
    SubscriptionType,
    COUNT(*) AS TotalCustomers,
    SUM(IsChurned) AS ChurnedCustomers,
    (SUM(IsChurned) * 100.0 / COUNT(*)) AS ChurnRate
FROM CustomerSubscriptions_
GROUP BY SubscriptionType;
```
<img width="1366" height="721" alt="image" src="https://github.com/user-attachments/assets/dd950b88-07be-4a7a-a170-79acd8a81719" />

## 6. List Top 10 customers with longest subscriptions (based on SubscriptionDate):-

```sql
SELECT *
FROM customersubscriptions_
ORDER BY SubscriptionDate ASC
LIMIT 10;
```
<img width="1357" height="721" alt="image" src="https://github.com/user-attachments/assets/0da10ee8-d5df-4e86-a765-64f68e5ff35c" />

## 7.Age group-wise churn analysis (e.g., 18–25, 26–35, etc.):-

```sql
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
```
<img width="1366" height="725" alt="image" src="https://github.com/user-attachments/assets/747cfb49-4e0f-45fc-a3db-0f85c61d4b24" />

# 📊 Power BI Dashboard Visuals

## 👥 KPI Cards

- 👥 Total Customers
- 🟢 Active Customers
- 🔴 Churned Customers
- 📉 Churn Percentage

---

## ⭕ Donut Chart

Shows Active vs Churned Customers.

---

## 📊 Bar Chart

Displays churn rate by subscription type.

---

## 📈 Line Chart

Shows churn trends over time.

---

## 🔍 Scatter Plot

Analyzes customer sessions vs feedback scores.

---

# 🧮 DAX Measures

## Total Customers

```DAX
Total Customers =
COUNT(CustomerSubscriptions[CustomerID])
```

---

## Active Customers

```DAX
Active Customers =
CALCULATE(
COUNT(CustomerSubscriptions[CustomerID]),
CustomerSubscriptions[IsChurned] = 0
)
```

---

## Churned Customers

```DAX
Churned Customers =
CALCULATE(
COUNT(CustomerSubscriptions[CustomerID]),
CustomerSubscriptions[IsChurned] = 1
)
```

---

## Churn Rate

```DAX
Churn Rate =
DIVIDE(
SUM(CustomerSubscriptions[IsChurned]),
COUNT(CustomerSubscriptions[CustomerID])
) * 100
```

---

# 🎨 Dashboard Design

<img width="1366" height="728" alt="image" src="https://github.com/user-attachments/assets/1cc09ffd-af4e-4976-ae79-c5582b7da642" />

---

# 📌 Key Insights

- Monthly subscription customers have the highest churn.
- Customers with low sessions are more likely to churn.
- Low feedback scores indicate dissatisfaction.
- Yearly subscribers are more loyal.
- Customer engagement strongly affects retention.

---

# 🚀 Business Impact

This dashboard helps gym businesses:

- Improve customer retention
- Identify high-risk customers
- Monitor subscription performance
- Increase customer engagement
- Make data-driven decisions

---

# 📷 Dashboard Features

✅ Interactive Filters  
✅ KPI Cards  
✅ Professional UI Design  
✅ Customer Analytics  
✅ Subscription Analysis  
✅ Churn Prediction Insights  

---

# 🏁 Conclusion

The Gym Membership Churn Analysis Dashboard successfully demonstrates how Power BI and SQL can be used together to analyze customer behavior and identify churn patterns. The dashboard provides valuable insights that help businesses improve customer satisfaction and retention through data-driven decision-making.
