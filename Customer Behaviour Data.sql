-- DEMOGRAPHICS ANALYSIS:

-- Group Customers by Age Ranges
SELECT 
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
	WHEN age BETWEEN 36 AND 45 THEN '36-45'
	WHEN age BETWEEN 46 AND 55 THEN '46-55'
	WHEN age BETWEEN 56 AND 65 THEN '56-65'
    ELSE 'Above 65'
  END AS Age_Range,
  COUNT(*) AS Customer_Count
FROM customerdata_shop
GROUP BY Age_Range
ORDER BY Age_Range ASC

-- Male-to-Female Ratio Among Customers
SELECT gender, COUNT(*) AS Gender_Count
FROM customerdata_shop
GROUP BY gender

-- Which US states have the highest and lowest average review ratings for purchased items?
SELECT US_States, AVG(ReviewRating) AS Avg_Review_Rating
FROM customerdata_shop
GROUP BY US_States
ORDER BY Avg_Review_Rating DESC, US_States
LIMIT 1; -- Highest rated state

SELECT US_States, AVG(ReviewRating) AS Avg_Review_Rating
FROM customerdata_shop
GROUP BY US_States
ORDER BY Avg_Review_Rating, US_States
LIMIT 1; -- Lowest rated state



-- PURCHASE BEHAVIOR AND PATTERNS:

-- Average price of each product and category (IN USD)
SELECT item_purchased, AVG(purchase_amount) AS Avg_Price_Per_Item
FROM customerdata_shop
GROUP BY item_purchased
ORDER BY Avg_Price_Per_Item ASC 

SELECT category, AVG(purchase_amount) AS Avg_Price_Per_Category
FROM customerdata_shop
GROUP BY category;

-- What is the distribution of purchase frequency among different subscription status levels?
SELECT Subscription_Status, COUNT(*) AS Purchase_Count
FROM customerdata_shop
GROUP BY Subscription_Status

-- How does the average purchase amount vary for different colors of items purchased in different seasons?
SELECT Season, Color, AVG(Purchase_Amount) AS Avg_Purchase_Amount
FROM customerdata_shop
GROUP BY Season, Color
ORDER BY Season, Color

-- What is the average number of previous purchases for customers using different shipping types?
SELECT Shipping_Type, AVG(Previous_Purchases_Quantity) AS Avg_Previous_Purchases
FROM customerdata_shop
GROUP BY Shipping_Type;

-- Find the Maximum and Minimum Frequency of Purchases
SELECT MAX(Frequency_of_Purchases) AS Max_Freq_of_Purchases, MIN(Frequency_of_Purchases) AS Min_Freq_of_Purchases
FROM customerdata_shop


-- FINANCIAL AND TRANSACTION ANALYSIS:

-- Calculate the average purchase amount by state
SELECT US_States, AVG(Purchase_Amount) AS Avg_Purchase_Amount
FROM customerdata_shop
GROUP BY US_States
ORDER BY Avg_Purchase_Amount DESC

-- Find the total number of transactions across all payment methods and determine the average purchase amount.
SELECT Payment_Method, COUNT(*) AS Transaction_Count, AVG(Purchase_Amount) AS Average_Purchase_Amount
FROM customerdata_shop
GROUP BY Payment_Method
ORDER BY Transaction_Count DESC