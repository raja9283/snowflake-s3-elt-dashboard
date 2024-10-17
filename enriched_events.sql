create or replace view ECOM.PUBLIC.ENRICHED_EVENTS(
	EVENT_TYPE,
	event_time,
	USER_ID,
	PRODUCT_ID,
	QUANTITY,
	PRICE,
	PRODUCT_NAME,
	CATEGORY,
    SUBCATEGORY,
	CUSTOMER_NAME,
	LOCATION,
    AGE_GROUP
) as
SELECT
    events.event_type,
    events.event_time, 
    events.customer_id,
    events.product_id,
    events.quantity,
    events.price,
    products.product_name,
    products.category,
    products.subcategory,
    customers.customer_name,
    customers.location,

    dfdf
    dfdf
    customers.AGE_GROUP,
FROM events AS events
LEFT JOIN products
    ON events.product_id = products.product_id
LEFT JOIN customers
    ON events.customer_id = customers.customer_id;