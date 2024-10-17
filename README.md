# **Snowflake POC: Real-Time Data Streaming and Analytics with Snowpipe, S3, and Superset**

## **Overview**

This proof-of-concept (POC) demonstrates a real-time data pipeline using **Snowflake**, **AWS S3**, **Snowpipe**, and **Apache Superset** for streaming, transforming, and visualizing eCommerce event data. The architecture highlights the capabilities of **Snowflake** for handling real-time streaming data ingestion, ELT processes, and the use of **Superset** for dashboarding and data analytics.

### **Technologies Used:**
- **Snowflake**: Data storage, Snowpipe for real-time data ingestion, Snowpark for transformations.
- **AWS S3**: Cloud storage for raw data files.
- **Snowpipe**: Automated and continuous data loading from S3.
- **SQS (AWS Simple Queue Service)**: Used by Snowpipe to trigger real-time data ingestion.
- **Apache Superset**: BI tool for creating real-time dashboards from transformed Snowflake data.

---

## **Project Workflow**

1. **Data Ingestion**: Event data (e.g., purchase, add_to_cart) is uploaded to an S3 bucket and streamed into Snowflake via **Snowpipe**.
2. **Staging in Snowflake**: S3 data is staged in Snowflake using the `CREATE STAGE` command.
3. **Transformation (ELT)**: Raw event data is enriched using **Snowflake SQL** by joining with customer and product tables.
4. **Dashboarding**: The transformed `enriched_events` table is visualized using **Superset** to analyze metrics like product sales, customer segmentation, and revenue trends.

---

## **Files and Directories**

### **1. `table_ddl.sql`**
This file contains the DDL statements for creating the tables:
- **`ecommerce_events`**: Raw event data streamed from S3.
- **`products`**: Product details such as name, category, and price.
- **`customers`**: Customer details such as name, age group, and location.

### **2. `snowflake_pipe.sql`**
This file contains the SQL commands for setting up the **Snowflake stage** and **Snowpipe** to ingest data from an AWS S3 bucket using **SQS** for real-time streaming.

### **3. `enriched_events.sql`**
This file contains the SQL logic to transform raw event data by joining it with product and customer tables to create an **enriched events** table for analytics and visualization.

---

## **Superset Dashboard**

The **Superset** dashboard visualizes key metrics and insights derived from the `enriched_events` view. Some of the key analyses include:
1. **Total Revenue by Product Category**
2. **Customer Segmentation by Age Group**
3. **Top Products by Sales Volume**
4. **Revenue by Customer Location**

### Example Queries for Superset:

- **Total Revenue by Product Category**:

```sql
SELECT
    category,
    SUM(price * quantity) AS total_revenue
FROM enriched_events
GROUP BY category;
