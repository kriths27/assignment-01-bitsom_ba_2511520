## Architecture Recommendation

For a fast-growing food delivery startup that needs to manage diverse data types—GPS logs, text reviews, transactions, and images—a Data Lakehouse architecture is the most effective choice. A Lakehouse blends the low-cost, flexible storage of a Data Lake with the performance, reliability, and transactional guarantees of a Data Warehouse.

Reasons:

**1. Handles all data types seamlessly** 
The startup deals with multiple formats: JSON/Parquet for transactions, unstructured text for reviews, and binary files for images and GPS logs. A Lakehouse can store all of these in their native formats, just like a Data Lake, while still enabling structured SQL queries across them.

**2. Reliability with schema enforcement and ACID transactions**
Unlike a traditional Data Lake, frameworks such as Delta Lake or Apache Iceberg ensure data integrity. This is critical for financial transactions, preventing corruption during concurrent writes. Features like “Time Travel” also allow auditing of payment records or tracking changes in menu images over time.

**3. One platform for analytics and AI**
Food delivery businesses thrive on machine learning, predicting delivery times from GPS data or analyzing customer sentiment in reviews. A Lakehouse gives data scientists direct access to raw data for model training, while BI analysts can run performant SQL queries for reporting. This unified approach eliminates costly and redundant data movement between separate systems.
