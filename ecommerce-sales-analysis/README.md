# E-Commerce Sales Analysis

## Project overview
This beginner portfolio project analyzes a **synthetic** e-commerce sales dataset for an example retailer. It is designed for learning Excel, SQL, and Power BI.

## Business questions
1. What are total net sales and order count?
2. How do sales change month by month?
3. Which product categories and products perform best?
4. Which cities generate the most sales?
5. How do online and store channels compare?
6. What is the average order value?

## Tools
- Excel: data review, cleaning, sorting, filtering, PivotTables, charts
- PostgreSQL (or adapt queries for MySQL): SQL analysis
- Power BI: dashboard and visual storytelling
- GitHub: project documentation and version control

## Dataset
`data/ecommerce_sales.csv` contains 40 synthetic order records from January to June 2026. No real customer information is included.

Important fields:
- `order_id`: unique order identifier
- `order_date`: order date
- `customer_id`: synthetic customer identifier
- `city`, `category`, `product`: order descriptors
- `quantity`, `unit_price_inr`, `discount_rate`: order inputs
- `gross_sales_inr`: quantity multiplied by unit price
- `discount_amount_inr`: gross sales multiplied by discount rate
- `net_sales_inr`: gross sales minus discount amount
- `sales_channel`: Online or Store

## How to use the project

### 1. Excel
1. Open `data/ecommerce_sales.csv` in Excel.
2. Check column headings, date format, blanks, duplicates, and data types.
3. Use filters and sorting.
4. Create PivotTables for net sales by month, category, city, and sales channel.
5. Add charts and save your workbook under `excel/`.

### 2. SQL
1. Create a database in PostgreSQL.
2. Run the table creation statement from `sql/analysis_queries.sql`.
3. Import the CSV into the table. If your import tool does not support importing the calculated columns directly, import the CSV into a staging table or map the columns carefully.
4. Run the analysis queries and save useful results/screenshots under `reports/`.

Note: The SQL file uses PostgreSQL date functions. For MySQL, replace `DATE_TRUNC` expressions with an expression such as `DATE_FORMAT(order_date, '%Y-%m-01')`.

### 3. Power BI
1. Select **Get Data → Text/CSV** and load `data/ecommerce_sales.csv`.
2. Verify data types: `order_date` as Date, amounts as Decimal Number, `quantity` as Whole Number.
3. Create KPI cards for Net Sales, Order Count, and Units Sold.
4. Add a line chart for monthly net sales.
5. Add bar charts for category and city sales.
6. Add a channel slicer and a month/date slicer.
7. Save your `.pbix` file under `powerbi/`.

## Suggested dashboard measures
```DAX
Total Net Sales = SUM(ecommerce_sales[net_sales_inr])
Order Count = DISTINCTCOUNT(ecommerce_sales[order_id])
Units Sold = SUM(ecommerce_sales[quantity])
Average Order Value = DIVIDE([Total Net Sales], [Order Count])
```

## Deliverables
- Cleaned or reviewed dataset
- Excel analysis workbook
- SQL analysis queries
- Power BI dashboard
- A short findings report with evidence-based insights

## Analysis notes
Do not claim that one factor caused a sales change unless the data supports causation. Describe what the dataset shows, and label recommendations as hypotheses to investigate.

## Limitations
This is a small synthetic practice dataset, not real company data. Findings should not be generalized to actual e-commerce businesses.

## Next steps
Complete the Excel analysis first, then SQL, then Power BI. Add screenshots and your own findings as you work. Do not claim deliverables are complete until you have created and checked them.
