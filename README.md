# Analysis of Sales performance for Balanced Tree Clothing Company


## Project Background

Balanced Tree Clothing Company prides themselves on providing an optimised range of clothing and lifestyle wear for the modern adventurer!

Danny, the CEO of this trendy fashion company has asked you to assist the team’s merchandising teams analyse their sales performance and generate a basic financial report to share with the wider business.

This project analyze data from products and sales to determine the sales performance of the company.

The insights and recommendations are given in the following key areas:

- High level analysis: Provides a high level overview about the sales performance of the company, including
financial metrics on a montly and daily basis.

- Transaction analysis: Analyze transaction-related data to extract KPIs, including unique transactions, average unique products purchased in each transaction, average discount value per transaction, etc.

- Product analysis: Analyze product-related data to extract KPIs, including  total quantity, revenue and discount for each segment,  top selling product for each segment, top selling product for each category, etc.


## Data structure and initial checks

The dataset (database) presents 4 tables. The first, called `balanced_tree.product_details` includes all information about the entire range that Balanced Clothing sells in their store.
The second, `balanced_tree.sales` contains product level information for all the transactions made for Balanced Tree including quantity, price, percentage discount, 
member status, a transaction ID and also the transaction timestamp. The previous table spans data from the Q1 of 2021.The tables contains 12 and 15,095 observations respectively or 15,107 in total.


![erd](erd.png)


## Executive Summary

### Overview of Findings

The sales of the current month (March 2021) exhibits positive performance in different financial health metrics compared to previous months (February and January). The metrics used were Total units sold, Total sales revenue, Net sales revenue and Gross profit. The following sections
will explore additional contributing factors and highlight key opportunity areas for improvement.

Below is the high level analysis page from the Tableau Dashboard and more examples are included throughout the report. The entire interactive dashboard can be viewed [here](https://public.tableau.com/views/SalesPerformanceDashboardforBalancedTreeClothingCompany/HighLevelAnalysisDashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


[![Sales Performance Dashboard](https://public.tableau.com/static/images/Sa/SalesPerformanceDashboardforBalancedTreeClothingCompany/HighLevelAnalysisDashboard/1.png)](https://public.tableau.com/views/SalesPerformanceDashboardforBalancedTreeClothingCompany/HighLevelAnalysisDashboard)
