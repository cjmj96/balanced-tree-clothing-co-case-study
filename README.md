# Analysis of Sales performance for Balanced Tree Clothing Company


## Project Background

Balanced Tree Clothing Company prides themselves on providing an optimised range of clothing and lifestyle wear for the modern adventurer!

Danny, the CEO of this trendy fashion company has asked you to assist the team’s merchandising teams analyse their sales performance and generate a basic financial report to share with the wider business.

This project analyze data from products and sales to determine the sales performance of the company.

The insights and recommendations are given in the following key areas:

- High level analysis: Provides a high level overview about the sales performance of the company, including
financial metrics on a montly and daily basis.

- Transaction analysis: Analyze transaction-related data to extract KPIs, including unique transactions, average unique products purchased in each transaction, average discount value per transaction, etc.

- Product analysis: Analyze product-related data to extract KPIs, including  total quantity, revenue and discount for each segment, top selling product for each segment, top selling product for each category, etc.


## Data structure and initial checks

The dataset (database) presents 2 tables. The first, called `balanced_tree.product_details` includes all information about the entire range that Balanced Clothing sells in their store.
The second, `balanced_tree.sales` contains product level information for all the transactions made for Balanced Tree including quantity, price, percentage discount, 
member status, a transaction ID and also the transaction timestamp. The previous table spans data from the Q1 of 2021.The tables contains 12 and 15,095 observations respectively or 15,107 in total.


![erd](erd.png)

The database schema can be found [here](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/main/code/balanced_tree_clothing_co_schema.sql).

## Executive Summary

### Overview of Findings

The sales of the current month (March 2021) exhibits positive performance in different financial health metrics compared to previous months (February and January). The metrics used were Total units sold, Total sales revenue, Net sales revenue and Gross profit. The following sections
will explore additional contributing factors and highlight key opportunity areas for improvement.

Below is the high level analysis page from the Tableau Dashboard and more examples are included throughout the report. The entire interactive dashboard can be viewed [here](https://public.tableau.com/views/SalesPerformanceDashboardforBalancedTreeClothingCompany/HighLevelAnalysisDashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[![Financial Sales Analysis Dashboards](https://public.tableau.com/static/images/Fi/FinancialSalesAnalysisforBalancedTreeClothingCompany/HighLevelAnalysisDashboard/1_rss.png)](https://public.tableau.com/views/FinancialSalesAnalysisforBalancedTreeClothingCompany/HighLevelAnalysisDashboard)

The following links contains all the PostgreSQL queries that we used in our sales analysis. These queries are available in the `/code` directory, specifically in these GitHub links: [High-Level Analysis](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/main/code/high_level_analysis.sql),[Transaction Analysis](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/main/code/transaction_analysis.sql), and [Product Analysis](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/main/code/product_analysis.sql).

## High Level Analysis


### Total Units Sold

In March, the amount of units sold was 15,608, up by 5.3% (+788 units) from February (14,820). This trend is also apparent in the 5.5% increase from January.


![total-units-sold](./total-units-sold.PNG)

### Total Sales Revenue

In March, the total sales revenue reached $447,227, up by 6.1% from February ($421,554). This consistent growth pattern is also observed in 
the 6.3% increase from January.

![total-sales-revenue](./total-sales-revenue.PNG)

### Net Sales Revenue

In March, the net sales revenue climbed to $394,248, up by 6.6% from February ($421,554). This consistent growth pattern is also observed in 
the 6.8% increase from January.

![net-sales-revenue](./net-sales-revenue.PNG)

### Total Discount Amount

In March, the total discount amount reached $52,978, up by 2.5% from February ($51,661). This consistent growth pattern is also observed in the 2.6% rise from January.

![total-discount-amount](./total-discount-amount.PNG)

### Gross Profit


In March, the gross profit climbed to $157,699, up by 6.6% from February ($147,957). This consistent growth pattern is also observed in the 6.8% increase from January.

![gross-profit](./gross-profit.PNG)



### Sales Revenue & Gross Profit by Segment


Shirts were the leader in both sales revenue and profit with $141,500 and $49,800, respectively. This represented a 6.4% increase in revenue and and 6.7% increase in profit from February, as well a considerable 7.52%, 7.7% growth in both metrics from January.

![sales-revenue-and-gross-profit-by-segment](./sales-revenue-and-gross-profit-by-segment.PNG)

## Transaction Analysis


### Unique Transactions

March had 860 transactions, up by 5.9% from February (812). This consistent growth pattern is also observed in the 3.86% increase from January (828).


![unique-transactions](./unique-transactions.PNG)

### Average Unique Products per Transaction


In March, customers bought an average of 6.5 distinct items per transactions, down by 1% from February (6.6). This pattern is inexistent (6.5) in January.


![average-unique-products-per-transaction](./average-unique-products-per-transaction.PNG)


### Average Discount Value


In March, the average discount value reached a 11.8%, down by 3.4% from February. This consistent decrease pattern is also observed in the 
4% decrease from January.

![average-discount-value](./average-discount-value.PNG)

### Transaction Split for member vs non-member

In March, the transactions are mostly done by member clients with a 67.7% (510), a consistent trend also observed in previous months.

![transactions-split-for-member-vs-non-member](./transactions-split-for-member-vs-non-member.PNG)


### Average Sales Revenue for member vs non-member

In March, the average sales revenue was $86 and $87 for member and non-member respectively. These amounts remained relatively stable in previous months.


![average-sales-revenue-for-member-vs-non-member](./average-sales-revenue-for-member-vs-non-member.PNG)

## Product Analysis

### Top 3 Products by Sales Revenue (Pre-discount)

The month of March, saw the blue polo shirt ($75,000), the grey fashion jacket ($71,000), and the white tees shirt ($54,000) generating the highest revenues. This pattern of sales was similar to that of February. However, the rankings for this were different for that of January, where the grey fashion jacket sold the most, followed closely by the blue polored polo shirt which took the second position.

![top-3-products-by-sales-revenue](./top-3-products-by-sales-revenue.PNG)

### Sales Revenue Split by Category (%)

In March, Men’s products still were the leading category with 56% share of total sales revenue. This lead, interestingly, is the same for the last two months of February and January.

![sales-revenue-split-by-category](./sales-revenue-split-by-category.PNG)

### Top Product per Category

In the month of March, the blue polo shirt topped Men’s sales with 1,324 units while grey fashion jacket topped Women’s sales with 1,322 units. This is an unwavering trend as the two products have been on top since the month of January.

![top-product-per-category](./top-product-per-category.PNG)

### Most frequent 3-Product Combo in Transactions

In March, the top product mix included a Women’s Black Straight Jeans, a pair of Men’s Pink Fluorescent Polkadot Socks, and Men’s White T-shirt with 136 sales recorded. This trend was evident also in Q1 with two products constant (Jeans and T-shirt) and a different third product every month: Women’s Khaki Suit Jacket in February (112 sales) and Men’s Navy Solid Socks in January (117 sales).

![most-frequent-3-product-combo-in-transaction](./most-common-3-product-combo-in-transactions.PNG)

### Sales Revenue Split by Segment per category (%)

In March, the revenue distribution indicated Men's Shirts leading at 56.5% while Socks followed at 43.5% meanwhile Women’s Jackets led at 63.2% while Jeans retreated at 36.8%. Generally, the same pattern of distribution was observed in the first quarter of the year (January-March).

![sales-revenue-split-by-segment-per-category](./sales-revenue-split-by-segment-per-category.PNG)

### Top Product per Segment

In March, the leaders by category stood as the following - Black Straight Jeans (1,324 units) in Jeans, Blue Polo Shirts (1,281 units) in Shirts, Grey Fashion Jackets (1,254 units) in the Jackets category, and Solid Navy Socks (1,190 units) in the sock category. These products, however, saw similar trends whereby these products maintained the segments for each of the months for the Q1 (January –March).


![top-product-per-segment](./top-product-per-segment.PNG)


### Transaction Penetration per Product


When it comes to the sales of the White Tee Shirt for men it was the center of attention in March and through it conquered a market penetration of 53% squeezing the previous month’s leader Khaki Suit Jackets whose market share stood at 54%. As it differs from the market leader this January who was the Cream Relaxed Jeans with 52%.

![transaction-penetration-per-product](./transaction-penetration-per-product.PNG)

### Sales Revenue Split by Product per Segment

It was observed across the respective segments that there was a uniform sales pattern as in the earlier months. Interestingly, in every segment, the leading product was its top revenue garner: Grey Fashion Jackets (57.5%) in the Jackets category, Black Straight Jeans (58.5%) in the Jeans category, Blue Polo shirts (53.3%) in the Shirts category, and Navy Solid Socks (44.1%) in the Socks category, while the second and third products in the segments also had a consistent revenue share.

![sales-revenue-split-by-product-per-segment](./sales-revenue-split-by-product-per-segment.PNG)

## Recommendations

In consideration of the findings derived from the case study, the following are important recommendations sorted by strategic areas: 

1. Optimizing Sales Performance:

   1.1 Take advantage of the increase in sales in march by raising strategies in 
   terms of stock and promotion of sales within that period. The projections in 
   marketing during that time should give advice on discounts to enable 
   such tendencies to continue.

   1.2 Prioritize extending the assortment of the category of men’s apparel,
   primarily shirts (Blue Polo), since they account for 56% of the overall
   revenues while equally ensuring that there are high levels of stocks for
   other regular best-shopping items such as Grey Fashion Jackets.

2. Enhancing Profitability: 

    2.1 There is a need to sustain the successful downward revision of 
    the discount rates (recorded March improvement of 3.4%) in order to
    enhance margin developments.

    2.2 Tactics of marketing should concentrate on price cuts for slow
    moving stock only and not in overarching marketing strategies.

3. Inventory Management:
                                                 
     3.1 Continue to stock the highest selling three products which include 
     the Black Straight Jeans, Pink Fluorescent Polka Dot Socks and White
      Dinner T-shirt in relatively higher quantities. 

     3.2 Introduce clutter-busting or simplification strategies on certain 
    products accompanied by the re-planning of inventory management where
    the business transaction rates are more than fifty percent.

    3.3  Strategically concentrate on the management of such products that have
    exhibited moderate performance across segments for the entire period.
    
    3.4 To maximize their return on investment, the company should either
    discontinue or redesign the product lines that command very low levels
    of transaction penetration rates.

4. Customer Interaction:

    4.1 Considering the high share of transactions made by the members, 
    initiatives targeting non-member customers should be put in place.

    4.2 Develop new offers to the members reflecting their transaction history. 

    4.3 Devise advertising approaches for the most ordered product pairings 
    including the three Most Frequently Bought Together Combo in the analysis.