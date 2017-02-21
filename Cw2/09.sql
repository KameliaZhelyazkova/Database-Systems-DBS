SELECT S.ocust, MAX(S.OrderInterval)
FROM ((SELECT O1.ocust, MIN(O2.odate - O1.odate ) AS OrderInterval
     FROM Orders O1 INNER JOIN Orders O2 ON O1.ocust = O2.ocust
     WHERE O2.odate > O1.odate
     GROUP BY O1.ocust, O1.odate) UNION (SELECT O1.ocust, 0 AS OrderInterval
                                          FROM Orders O1 JOIN Orders O2 ON O1.ocust = O2.ocust
                                          WHERE O2.odate - O1.odate = 0 AND O1.ordid <> O2.ordid)) AS S
GROUP BY S.ocust
ORDER BY S.ocust;
