-- Main objective: Using a 3NF database created to increase revenue and the overall user experience for the online art marketplace.
-- 1. Identifying combinations of painting features that are popular:
SELECT desn.subject_of_painting, desn.style, desn.medium, 
COUNT(*) AS paintings_sold, AVG(sale.price) AS average_price, 
SUM(sale.price) as total_sales
FROM artwork_description desn JOIN artwork_sale sale
ON desn.painting_ID = sale.painting_ID
GROUP BY desn.subject_of_painting, desn.style, desn.medium
ORDER BY total_sales DESC
/*Result: The top few combinations have 'watercolour' as their medium,
In particular, 'watercolour' paintings with 'abstract' subject and 'abstract 
expressionism' style has the most sales. Hence, the marketplace's 
algorithm can recommended these popular paintings types, in turn improving
revenue (assuming commission is drawed from sellers with each sale
of a painting).  

The marketplace can also show sellers the popular painting types and 
unpopular painting types (e.g. 'oil' paintings with 'portrait' subject and 
'impressionism' style) so that sellers can have a better idea of which types
can generate better sales. 

In both cases, this improves the user experience.*/

--2. Finding the key groups of buyers in the marketplace
-- Assumption: The eventual buyer of a painting is the painting's target audience
SELECT tar.target_audience_name, COUNT(*) AS paintings_sold, 
AVG(sale.price) AS average_price, SUM(sale.price) as total_sales
FROM (artwork_description desn 
JOIN artwork_sale sale ON desn.painting_ID = sale.painting_ID) 
JOIN target_audience tar ON tar.target_audience_ID = desn.target_audience_ID
GROUP BY tar.target_audience_name
ORDER BY total_sales DESC;
/*Results: 'Art Collectors' pay the highest average price
for a painting. Meanwhile, 'Interior Designers' purchase the most paintings
and pay the third-highest average price for a painting.
Hence, marketing and advertisement efforts can be targeted at these
two groups (e.g. using channels that they are familiar with) to increase
footfall and conversion rate. The website can also be designed to cater
to the needs of these target audiences (e.g. adding 'Recommended Environment'
filter for 'Interior Designers'. This will improve the customer experience.*/

--3. Taste and preferences of key buyers
SELECT desn.subject_of_painting, COUNT(*) AS paintings_sold 
FROM artwork_description desn 
JOIN target_audience tar ON tar.target_audience_ID = desn.target_audience_ID
WHERE tar.target_audience_name in ('Interior Designers', 'Art Collectors')
GROUP BY desn.subject_of_painting
ORDER BY paintings_sold DESC;
/*Results: Artworks with 'wildlife' or 'seascape' subjects can be recommended
more to users, especially the main buyers.*/

--4. Top sellers
SELECT painter.painter_name, COUNT(*) AS paintings_sold 
FROM artwork_description desn 
JOIN painter ON painter.painter_ID = desn.painter_ID
GROUP BY painter.painter_name
ORDER BY paintings_sold DESC
LIMIT 3;
/*Rewards can be given out to the top sellers or contracts can
be signed with them to incentivise these sellers to continue selling 
their paintings on the marketplace, guaranteeing a consistent
stream of revenue for the marketplace.*/

--5. Buyer demographics for each artist
SELECT painter.painter_name, tar.target_audience_name, COUNT(*) AS paintings_sold 
FROM (artwork_description desn 
JOIN target_audience tar ON tar.target_audience_ID = desn.target_audience_ID)
JOIN painter ON painter.painter_ID = desn.painter_ID
GROUP BY painter.painter_name, tar.target_audience_name
ORDER BY painter.painter_name DESC;
/*Results: The demographics of an artist's buyers can be included in a personalised
sales report provided by the marketplace. He or she can thus create more artworks 
catering to their main buyers' tastes and preferences. This improves the sellers' user
experience and can lead to an increase in revenue in the long term.*/  

-- 6. Delivery timespan
-- Assumption: The shipment of paintings is carried out by the platform instead of the sellers.
SELECT shipment, AVG(delivery) as average_delivery_timespan 
FROM artwork_sale
GROUP BY shipment
ORDER BY shipment
/*Given how the average delivery timespan of express shipping does not differ by much
from the other shipment methods, more effort can be placed to improve the shipping process
to enhance the customer experience.*/  
