## ETL Decisions

**Decision 1 — Date Standardization**

**Problem**: The raw data contained inconsistent date formats (e.g., DD/MM/YYYY, DD-MM-YYYY, and YYYY-MM-DD). This inconsistency would cause errors when loading into SQL DATE fields.

**Resolution**: I implemented a flexible date-parsing logic during the ETL process to convert all formats into a standardized ISO YYYY-MM-DD. In addition, I generated an integer-based date_key (e.g., 20230829) to enable efficient joins with the date dimension.

**Decision 2 — Categorical Data Normalization**

**Problem**: Product categories were inconsistently cased (e.g., electronics vs. Electronics) and sometimes used synonyms for the same group (e.g., Grocery vs. Groceries).

**Resolution**: I applied a title-case transformation to all category names and standardized synonyms by mapping “Grocery” to “Groceries.” This ensured that all related products roll up correctly in business intelligence reports.

**Decision 3 — Handling Missing Store City Data**

**Problem**: The store_city column had NULL values for about 6% of records, leading to gaps in geographic reporting.

**Resolution**: I built a store-to-city lookup table using existing non-null records (e.g., recognizing that “Chennai Anna” always maps to “Chennai”). This mapping was then applied programmatically to fill missing city values before loading into dim_store.
