# Olist E-Commerce Business Analysis — Business Insights

This document contains the results and business interpretations obtained from analysing the Brazilian E-Commerce Public Dataset by Olist using PostgreSQL.

---

## 1. Data Validation

### 1.1 Duplicate Order ID Check

- Table: `olist_orders`
- Column: `order_id`
- Result: No duplicate order IDs were found.

**Business Insight:**

No duplicate order IDs were detected in the orders table during validation.

### 1.2 NULL Value Check

Columns checked:

- `order_id`
- `customer_id`
- `order_status`

**Result:**

All three columns contained 99,441 non-NULL values.

No missing values were found in these selected columns.

### 1.3 Customer Order Check

- Table: `olist_orders`
- Column: `customer_id`
- Result: No repeated customer IDs were found in this table.

### 1.4 Repeat-Purchase Analysis

**Key Finding:**

The highest number of orders placed by a single customer was **17**.

**Business Insight:**

The `customer_unique_id` column helps identify the same actual customer across multiple customer records. This makes it useful for analysing repeat purchases.

---

## 2. Revenue Analysis

### 2.1 Total Product Revenue

**Result: R$13,591,643.70**

**Business Insight:**

The dataset contains approximately R$13.59 million in product sales revenue, excluding freight charges.

### 2.2 Total Freight Charges

**Result: R$2,251,909.54**

**Business Insight:**

Approximately R$2.25 million was recorded in freight charges across all order items.

### 2.3 Average Product Price

**Result: R$120.65**

**Business Insight:**

The average price per ordered item was approximately R$120.65.

This represents average item price, not average order value.

---

## 3. Product Sales Analysis

### 3.1 Top 10 Best-Selling Products

**Key Findings:**

- Highest-selling product: 527 units.
- Second-highest-selling product: 488 units.
- Difference: 39 units.

**Business Insight:**

The leading product had a noticeable sales advantage over the second-ranked product.

---

## 4. Product Category Analysis

### 4.1 Top 10 Categories by Units Sold

| Category | Units Sold |
|---|---:|
| cama_mesa_banho | 11,115 |
| beleza_saude | 9,670 |
| esporte_lazer | 8,641 |
| moveis_decoracao | 8,334 |
| informatica_acessorios | 7,827 |
| utilidades_domesticas | 6,964 |
| relogios_presentes | 5,991 |
| telefonia | 4,545 |
| ferramentas_jardim | 4,347 |
| automotivo | 4,235 |

**Business Insight:**

The `cama_mesa_banho` category recorded the highest sales volume, with 11,115 units sold.

### 4.2 Top 10 Categories by Revenue

| Category | Revenue (BRL) |
|---|---:|
| beleza_saude | 1,258,681.34 |
| relogios_presentes | 1,205,005.68 |
| cama_mesa_banho | 1,036,988.68 |
| esporte_lazer | 988,048.97 |
| informatica_acessorios | 911,954.32 |
| moveis_decoracao | 729,762.49 |
| cool_stuff | 635,290.85 |
| utilidades_domesticas | 632,248.66 |
| automotivo | 592,720.11 |
| ferramentas_jardim | 485,256.46 |

**Business Insight:**

The `beleza_saude` category generated the highest revenue, approximately R$1.26 million.

### 4.3 Category Comparison

- `cama_mesa_banho` ranked first in units sold but third in revenue.
- `beleza_saude` ranked second in units sold and first in revenue.
- `relogios_presentes` ranked seventh in units sold but second in revenue.
- `cool_stuff` appeared in the revenue top 10 but not in the units-sold top 10.

**Overall Business Insight:**

The category with the highest sales volume is not necessarily the category with the highest revenue. Differences in product prices influence revenue performance.

---

## 5. Monthly Sales Analysis

**Key Findings:**

- Highest revenue month: November 2017.
- Highest monthly revenue: R$1,010,271.37.
- Lowest revenue month: December 2016.
- Lowest monthly revenue: R$10.90.
- September 2018 recorded only R$145.00.

**Business Insights:**

- Monthly product revenue generally increased throughout 2017 and 2018.
- November 2017 recorded the highest monthly revenue.
- December 2016 and September 2018 recorded unusually low revenue values, potentially because these are incomplete periods.
- Monthly sales analysis helps businesses understand revenue trends and identify high-performing periods.

**Data Considerations:**

The analysis includes all order statuses. Cancelled and unavailable orders may affect the revenue interpretation.

The beginning and ending months of the dataset may also be incomplete. Further validation is required before treating these figures as final recognised revenue.

---

## 6. Customer Spending Analysis

**Key Findings:**

- Highest customer spending: R$13,440.00.
- Second-highest customer spending: R$7,388.00.
- Difference: R$6,052.00.

**Business Insight:**

The highest-spending customer spent R$13,440 on product purchases.

Customer spending was calculated using `SUM(price)` and excludes freight charges. Customers were identified using `customer_unique_id`.

---

## 7. Average Order Value (AOV) Analysis

**Key Finding:**

Average Order Value: **R$137.75**

**Methodology:**

1. Calculated the total product price for each order using `SUM(price)`.
2. Grouped records by `order_id`.
3. Calculated the average of the resulting order totals using `AVG()`.

**Business Insight:**

The average order generated approximately R$137.75 in product revenue.

**Note:** Freight charges are excluded. This is product-only AOV.

---

## 8. Payment Analysis

### 8.1 Payment Method Distribution

| Payment Method | Number of Payment Records |
|---|---:|
| Credit card | 76,795 |
| Boleto | 19,784 |
| Voucher | 5,775 |
| Debit card | 1,529 |
| Not defined | 3 |

**Business Insight:**

Credit cards were the most frequently recorded payment method, followed by boleto.

### 8.2 Revenue by Payment Method

| Payment Method | Payment Value (BRL) |
|---|---:|
| Credit card | 12,542,084.19 |
| Boleto | 2,869,361.27 |
| Voucher | 379,436.87 |
| Debit card | 217,989.79 |
| Not defined | 0.00 |
| **Total** | **16,008,872.12** |

**Business Insights:**

- Credit cards contributed approximately 78.34% of total payment value.
- Boleto contributed approximately 17.92%.
- Voucher and debit card payments contributed comparatively smaller amounts.
- Credit cards were the leading payment method by both payment count and payment value.

### 8.3 Payment Instalment Distribution

**Key Findings:**

- One instalment: 52,546 payment records.
- Two instalments: 12,413 payment records.
- Three instalments: 10,461 payment records.
- Four instalments: 7,098 payment records.
- Ten instalments: 5,328 payment records.
- The dataset contains payment records with instalment values up to 24.

**Business Insight:**

One-instalment payments were the most common. However, customers also used longer instalment plans.

**Note:** These figures represent payment records grouped by instalment count, not the number of individual instalments actually paid.

---

## 9. State-wise Revenue Analysis

**Key Findings:**

| Rank | State | Revenue (BRL) |
|---:|---|---:|
| 1 | SP | 5,202,955.05 |
| 2 | RJ | 1,824,092.67 |
| 3 | MG | 1,585,308.03 |
| 4 | RS | 750,304.02 |
| 5 | PR | 683,083.76 |

- Highest revenue state: São Paulo (SP) — R$5,202,955.05.
- Lowest revenue state: Roraima (RR) — R$7,829.43.
- Top three states contributed approximately 63.3% of total product revenue.

**Business Insight:**

São Paulo generated the highest product revenue, followed by Rio de Janeiro and Minas Gerais. Revenue is concentrated in these three states.

**Note:** Revenue represents product prices only and excludes freight charges.

---

## 10. Delivery Time Analysis

**Key Finding:**

Average delivery time: **12.56 days**

**Methodology:**

1. Subtracted purchase timestamp from customer delivery timestamp.
2. Converted the resulting interval into seconds using `EXTRACT(EPOCH FROM ...)`.
3. Divided by 86,400 to convert seconds into days.
4. Calculated the average delivery time.
5. Excluded records with missing purchase or delivery timestamps.

**Business Insight:**

Orders took approximately 12.56 calendar days on average to reach customers after purchase. This provides a baseline for evaluating delivery performance.

**Note:** Delivery time is calculated in calendar days, not business days.

---

## Overall Project Findings

The analysis revealed several useful patterns in the Olist e-commerce dataset:

1. Total product revenue was approximately R$13.59 million.
2. Average product price was R$120.65.
3. Average Order Value was R$137.75.
4. Credit cards accounted for approximately 78.34% of recorded payment value.
5. São Paulo generated the highest state-wise product revenue.
6. November 2017 was the highest-revenue month.
7. The `cama_mesa_banho` category recorded the highest number of units sold.
8. The `beleza_saude` category generated the highest category revenue.
9. Average delivery time was approximately 12.56 days.

## Final Conclusion

The project demonstrates how PostgreSQL can be used to validate, transform and analyse relational e-commerce data.

The analysis provided insights into product performance, customer spending, revenue distribution, payment behaviour, monthly sales trends and delivery performance.

The findings illustrate how SQL-based analysis can help businesses understand their operations and support data-driven decision-making.