# 🍕 SQL Pizza Sales Analysis

An end-to-end SQL analysis of one year of pizza sales data to uncover revenue trends, customer ordering behavior, and product performance — visualized through a Google Sheets dashboard.

---

## 📌 Project Overview

This project answers real business questions a pizza chain manager would actually ask:

- Which days and hours bring in the most orders?
- Which pizza sizes and categories do customers prefer?
- Which are the top 5 best-sellers and bottom 5 worst-sellers?
- What is the average order value and revenue per category?

All analysis was done using **SQL (MySQL)** for data extraction and **Google Sheets** for visualization and dashboarding.

---

## 📂 Dataset

| File | Description |
|------|-------------|
| `data/pizza_sales.csv` | Full order-level dataset — order ID, date, time, pizza name, category, size, quantity, price |

**Dataset scope:** 1 year of transaction records across 4 pizza categories and multiple sizes.

---

## 📊 Key Performance Indicators

| KPI | Value |
|-----|-------|
| 💰 Total Revenue |
| 🧾 Average Order Value |
| 🍕 Total Pizzas Sold |
| 📦 Total Orders |
| 📐 Avg Pizzas per Order |

---

## 🔍 Key Insights

### 1. 📅 Daily & Hourly Trends
- **Friday and Saturday** record the highest order volumes — weekend demand is significantly stronger
- **Peak ordering hours are 12–1 PM and 6–8 PM** — lunch and dinner rushes drive the bulk of daily sales
- Staffing and inventory planning should be optimized around these windows

### 2. 🍕 Category & Size Preferences
- **Classic and Supreme** categories lead in total orders
- **Large size** is the most preferred, followed by Medium
- XL and XXL sizes contribute very little — potential for discontinuation or targeted promotion

### 3. 🏆 Top 5 Best-Selling Pizzas
- *(List your top 5 by revenue or quantity from your SQL output)*
- These items should be featured prominently in promotions and combo deals

### 4. ⚠️ Bottom 5 Worst-Selling Pizzas
- *(List your bottom 5 from your SQL output)*
- Low performers should be evaluated for removal or recipe rebranding

---

## 🛠️ SQL Queries Used

### Total Revenue
```sql
SELECT ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;
```

### Average Order Value
```sql
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales;
```

### Hourly Order Trend
```sql
SELECT HOUR(order_time) AS order_hour,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY order_hour;
```

### Top 5 Best-Selling Pizzas by Revenue
```sql
SELECT pizza_name,
       ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;
```

### Bottom 5 Worst-Selling Pizzas
```sql
SELECT pizza_name,
       ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;
```

### Sales % by Pizza Category
```sql
SELECT pizza_category,
       ROUND(SUM(total_price), 2) AS total_revenue,
       ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct_share
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pct_share DESC;
```

---

## 📈 Dashboard Charts

| Chart | Type | Purpose |
|-------|------|---------|
| Daily trend for total orders | Bar chart | Identify peak days |
| Hourly trend for total orders | Line chart | Identify peak hours |
| % sales by pizza category | Pie chart | Category contribution |
| % sales by pizza size | Pie chart | Size preference |
| Total pizzas sold by category | Bar chart | Volume comparison |
| Top 5 best-selling pizzas | Bar chart | Star products |
| Bottom 5 worst-selling pizzas | Bar chart | Underperformers |

---

## 🎯 Business Recommendations

- **Staff up on Fridays and Saturdays** during 12–1 PM and 6–8 PM peak windows
- **Promote top sellers** in combos and meal deals to increase average order value
- **Review XL/XXL sizes** — low demand doesn't justify the inventory and prep cost
- **Bundle bottom performers** with popular items rather than keeping them as standalone options

---

## 🗂️ Project Structure

```
SQL_Pizza_Sales_Analysis/
│
├── data/
│   └── pizza_sales.csv          # Source dataset
├── sql/
│   └── pizza_sales_queries.sql  # All SQL queries used
├── dashboard/
│   └── dashboard_preview.png    # Google Sheets dashboard screenshot
├── outputs/
│   └── query_results/           # Exported CSV results from SQL
└── README.md
```

---

## 🚀 How to Run

1. Import `data/pizza_sales.csv` into **MySQL Workbench** or any SQL client
2. Run the queries from `sql/pizza_sales_queries.sql` in sequence
3. Export results and load into **Google Sheets** to reproduce the dashboard

---

## 🧠 What I Learned

- Writing aggregate SQL queries to compute business KPIs from raw transactional data
- Using `GROUP BY`, `ORDER BY`, `LIMIT`, and subqueries for ranked analysis
- Translating SQL output into clear visual charts in Google Sheets
- Identifying actionable business recommendations from data patterns

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Data extraction, KPI queries, trend analysis |
| Google Sheets | Dashboard and data visualization |
| Excel | Additional validation and cross-checks |

---

## 📜 License

This project is for educational and portfolio purposes only.

---

## 🙋‍♀️ About Me

**Shraddha Maheshwari** — Aspiring Data Analyst passionate about turning raw data into actionable business insights.

[![GitHub](https://img.shields.io/badge/GitHub-Shraddha567-black?logo=github)](https://github.com/Shraddha567)
