SELECT C.custid, COUNT(DISTINCT S.ordid) , CAST(AVG(S.Total) AS NUMERIC(10,2))
FROM Customers C LEFT JOIN (SELECT O.ocust, O.ordid, COALESCE((SUM(D.qty*P.price)), 0) AS Total
                            FROM Orders O Left Join (Details D NATURAL JOIN Products P) ON O.ordid = D.ordid
                            GROUP BY O.ocust, O.ordid) AS S ON C.custid = S.ocust
GROUP BY C.custid;