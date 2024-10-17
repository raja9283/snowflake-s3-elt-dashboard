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

- **`table_ddl.sql`**: Contains the DDL statements for creating the `ecommerce_events`, `products`, and `customers` tables.
- **`snowflake_pipe.sql`**: Contains SQL commands for creating a stage and Snowpipe to stream data from an AWS S3 bucket into Snowflake.
- **`enriched_events.sql`**: Contains the SQL logic for transforming raw data into an `enriched_events` table by joining it with the customer and product tables.

---

## **Superset Dashboard**

The **Superset** dashboard visualizes key metrics and insights derived from the `enriched_events` view. Some of the key analyses include:
1. **KPI Cards**
2. **Total Revenue by Product Category**
3. **Customer Segmentation by Age Group**
4. **Top Products by Sales Volume**
5. **Revenue by Customer Location**
6. **Orders Trend By Category**


---

## **Snowflake Features Demonstrated**

1. **Snowpipe for Real-time Streaming**:
   - Integrated Snowpipe with AWS S3 and SQS for seamless, real-time data ingestion.
   
2. **Data Transformation (ELT)**:
   - Utilized Snowflake's SQL capabilities for enriching raw event data by joining with product and customer details.
   
3. **Data Analytics**:
   - Leveraged **Apache Superset** to create interactive dashboards for business metrics such as product sales, customer analysis, and revenue analysis.

4. **Scalable Cloud Solution**:
   - Demonstrated a scalable architecture using **AWS S3**, **Snowflake**, and **Superset** for handling large volumes of data and performing real-time analytics.

---

## **How to Run the POC**

1. **Snowflake Setup**:
   - Execute `table_ddl.sql` to create the necessary tables for event data, products, and customers.
   - Load initial product and customer data into Snowflake.(Sample data is available inside the data folder)

2. **Snowpipe Configuration**:
   - Set up the Snowflake stage and pipe using the SQL from `snowflake_pipe.sql`.
   - Ensure S3 bucket is properly configured, and SQS is connected to trigger real-time ingestion.

3. **Data Transformation**:
   - Execute the SQL in `enriched_events.sql` to create a view that joins the event data with product and customer details.

4. **Dashboard Setup**:
   - Connect **Superset** to your Snowflake instance.
   - Create dashboards using the transformed data from the `enriched_events` table.

---

## **Conclusion**

This POC showcases the real-time data ingestion, transformation, and analytics capabilities of **Snowflake** combined with AWS S3 and **Apache Superset**. By leveraging Snowpipe, we can seamlessly stream data from an S3 bucket, enrich it with business context (product and customer details), and visualize real-time metrics to make data-driven decisions.
