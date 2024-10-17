-- create external stage reference the S3 bucket 
CREATE OR REPLACE STAGE ecommerce_stage
URL='s3://ecommerce-events-bucket//'
CREDENTIALS=(AWS_KEY_ID='aws_access_key' AWS_SECRET_KEY='aws_secret_key');

-- Define a Snowpipe to load data from the external stage into the events table.
CREATE OR REPLACE PIPE ecommerce_pipe
AUTO_INGEST = TRUE
AS
COPY INTO events
FROM @ecommerce_stage
FILE_FORMAT = (TYPE = 'CSV',SKIP_HEADER=1);

-- run below command and get the notification_channel(sqs arn) to add in s3 bucket properties 
show pipes;


