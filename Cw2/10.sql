SELECT S.ocust
FROM (SELECT O1.ocust, MIN(O2.odate - O1.odate ) AS OrderInterval
     FROM Orders O1 INNER JOIN Orders O2 ON O1.ocust = O2.ocust
     WHERE O1.odate < O2.odate
     GROUP BY O1.ocust, O1.odate) AS S
GROUP BY S.ocust
HAVING COUNT(S.*) >= 4 AND AVG(OrderInterval) < 30
ORDER BY S.ocust;