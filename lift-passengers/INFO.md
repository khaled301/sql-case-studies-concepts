# Source
-   techTFQ

## Questions
```
The relationship between the LIFT and LIFT_PASSENGERS table is such that
multiple passengers can attempt to enter the same lift, but the total weight
of the passengers in a lift cannot exceed the lifts' capacity.

Write a SQL query that produces a comma-separated list of passengers who can be accommodated in each lift without exceeding the lift's capacity. The passengers in the list should be ordered by their weight in increasing order.

Assume that the weights of the passengers are unique within each lift 

```

## Approach taken:
#### Identify Passengers and Their Weights:

-  Join the lifts and passengers tables to get all relevant data, including lift capacities and passenger weights.

#### Calculate Cumulative Weights:

-   For each lift, compute the cumulative weight of passengers as they attempt to enter the lift, ordered by their weight in ascending order.

#### Check Capacity Constraints:

-   For each passenger, check if adding their weight to the cumulative weight so far exceeds the lift’s capacity. Flag those who can be accommodated without exceeding the lift’s capacity.

#### Filter Eligible Passengers:

-   Select only those passengers who can fit into the lift based on the flag set in the previous step.

#### Create a Comma-Separated List:

-   Group the passengers who can fit into each lift and create a comma-separated list of their names, ordered by their weights.

### Resources

#### Window Function
https://dev.mysql.com/doc/refman/8.4/en/window-functions-usage.html

#### CTEs ==> Common Table Expression
https://dev.mysql.com/doc/refman/8.4/en/with.html
