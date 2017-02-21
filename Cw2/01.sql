SELECT C.country, COUNT(O.ordid)
FROM Customers C LEFT JOIN Orders O ON C.custid = O.ocust
WHERE (O.ordid IS NULL) OR (O.odate >= '2016-01-01' AND O.odate < '2017-01-01')
GROUP BY C.country;