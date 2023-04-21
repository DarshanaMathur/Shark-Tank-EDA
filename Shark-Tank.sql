Select all columns from the 'Shark Tank' table:
SELECT * FROM `Shark Tank`

Count the number of pitches per industry:
SELECT Industry, COUNT(*) AS number_of_pitches 
FROM `Shark Tank` 
GROUP BY Industry

Count the number of deals per industry where 'Deal' column is 'Yes':
SELECT Industry, COUNT(*) AS number_of_deals 
FROM `Shark Tank` 
WHERE Deal = 'Yes'
GROUP BY Industry

Calculate the conversion rate (percentage of deals) per industry:
SELECT Industry, ROUND(COUNT(CASE WHEN Deal='Yes' THEN 1 END) / COUNT(*) * 100, 2) AS conversion_rate 
FROM `Shark Tank` 
GROUP BY Industry

Count the number of pitches and deals by entrepreneur gender:
SELECT `Entrepreneur Gender`, COUNT(*) AS number_of_pitches, COUNT(CASE WHEN Deal='Yes' THEN 1 END) AS number_of_deals 
FROM `Shark Tank` 
GROUP BY `Entrepreneur Gender`

Calculate the conversion rate (percentage of deals) by entrepreneur gender:
SELECT `Entrepreneur Gender`, ROUND(COUNT(CASE WHEN Deal='Yes' THEN 1 END) / COUNT(*) * 100, 2) AS conversion_rate 
FROM `Shark Tank` 
GROUP BY `Entrepreneur Gender`

Count the number of deals made by each shark:
SELECT `Shark Name`, SUM(`Barbara Corcoran`) AS `Barbara Corcoran`, SUM(`Daymond John`) AS `Daymond John`, 
       SUM(`Kevin O'Leary`) AS `Kevin O'Leary`, SUM(`Lori Greiner`) AS `Lori Greiner`, 
       SUM(`Mark Cuban`) AS `Mark Cuban`, SUM(`Robert Herjavec`) AS `Robert Herjavec`, 
       SUM(`Guest`) AS `Guest`
FROM `Shark Tank`
GROUP BY `Shark Name`

Show the total equity offered and given up per industry, and the times equity liquidated:
SELECT Industry, AVG(CAST(REPLACE(Equity, '%', '') AS FLOAT)) AS `Offered Equity`, 
       AVG(CAST(REPLACE(`Equity.1`, '%', '') AS FLOAT)) AS `Given Up Equity`, 
       ROUND(AVG(CAST(REPLACE(`Equity.1`, '%', '') AS FLOAT)) / AVG(CAST(REPLACE(Equity, '%', '') AS FLOAT)), 2) AS `Times Equity Liquidated`
FROM `Shark Tank`
WHERE Deal = 'Yes' AND Equity IS NOT NULL AND `Equity.1` IS NOT NULL
GROUP BY Industry