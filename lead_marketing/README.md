# Lead Conversion Performance Analysis

## Business Problem

Despite generating over **8,000 Marketing Qualified Leads (MQLs)**, only **10.53%** successfully converted into customers.

The objective of this project was to identify which parts of the customer acquisition process could be evaluated using the available marketing and sales data, uncover actionable insights, and highlight the limitations that prevent a complete understanding of failed conversions.

---

## Business Questions

This project answers the following business questions:

1. Are enough Marketing Qualified Leads converting into customers?
2. Which acquisition channels generate the highest quality customers?
3. Which landing pages generate the most successful customer acquisitions?
4. How quickly are successful deals being closed?
5. What additional information is required to understand why most leads fail to convert?

---

## Dataset

The project uses the Brazilian Olist Marketing Funnel dataset.

### Files Used

- Marketing Qualified Leads (MQLs)
- Closed Deals
- Master Table (created by joining the two datasets)

Each row in the MQL dataset represents one qualified lead.

Each row in the Closed Deals dataset represents one successfully converted customer.

---

## Tools Used

- PostgreSQL
- SQL
- Power BI
- GitHub

---

## Project Workflow

Business Understanding

↓

Data Cleaning

↓

SQL Analysis

↓

Business Insights

↓

Power BI Dashboard

↓

Executive Recommendations

---

## Dashboard

(Add your dashboard screenshot here)

---

## Key Insights

- Only **10.53%** of Marketing Qualified Leads became customers.
- Organic Search and Paid Search generated the strongest acquisition performance.
- Approximately **66%** of successful deals closed within 30 days.
- A small number of landing pages generated the majority of successful customer acquisitions.
- Business characteristics of unsuccessful leads could not be analyzed because those attributes were only available for converted customers.

---

## Recommendations

### Marketing

Continue investing in Organic Search and Paid Search while identifying why these channels consistently generate high-quality customers.

### Website

Review the highest-performing landing pages and replicate successful design elements across other landing pages.

### Sales

Investigate deals remaining open for more than 90 days to identify opportunities for improving the sales process.

### Data Collection

Capture business characteristics for all Marketing Qualified Leads and collect CRM activity data to better understand failed conversions.

---

## Dataset Limitations

The current dataset does not contain:

- Website visitor data
- Visitor-to-MQL conversion data
- CRM interaction history
- Sales representative activity
- Reasons for failed conversions

These limitations prevent identifying the root causes behind approximately 90% of Marketing Qualified Leads failing to become customers.

---

## Repository Structure

```text
dashboard/
data/
python/
reports/
sql/
README.md
```

---

## Author

**Aarushi Sharma**