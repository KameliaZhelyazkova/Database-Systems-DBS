SELECT subquery.ocust,CAST(subquery.Total AS NUMERIC(10,2))
FROM (SELECT O.ocust, (SUM(D.qty*P.price)) AS Total
      FROM Orders O NATURAL JOIN Details D NATURAL JOIN Products P
      WHERE P.ptype = 'MUSIC' AND O.odate >= '2016-01-01' AND O.odate < '2016-07-01'
      GROUP BY O.ocust) AS subquery
WHERE subquery.Total < 50
UNION
SELECT C.custID, CAST(0 as NUMERIC(3,2))
FROM Customers C
WHERE NOT EXISTS (SELECT 1
                  FROM Orders O NATURAL JOIN Details D NATURAL JOIN Products P
                  WHERE C.custID = O.ocust AND P.ptype = 'MUSIC' AND O.odate >= '2016-01-01' AND O.odate < '2016-07-01');