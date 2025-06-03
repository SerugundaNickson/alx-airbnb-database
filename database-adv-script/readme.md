## Apply Aggregations and Window Functions

This task focuses on using SQL aggregation functions and window functions to analyze Airbnb booking data.

### Objectives
- Calculate the total number of bookings per user using the COUNT function.
- Rank properties based on how many bookings they have received using window functions.

### Implemented Queries

1. **Total Bookings per User**  
   Utilizes `COUNT()` and `GROUP BY` to get the total bookings each user made.

2. **Ranking Properties by Bookings**  
   Uses `RANK()` along with `OVER` and `ORDER BY` to rank properties by the volume of their bookings.

These techniques help in generating analytics for usage and popularity trends on the platform.
