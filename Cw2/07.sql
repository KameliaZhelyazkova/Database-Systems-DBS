(SELECT C.custid
FROM customers C
EXCEPT
SELECT C.custid
FROM (Customers C JOIN Orders O ON C.custid = O.ocust) NATURAL JOIN (Details D JOIN Products P ON D.pcode = P.pcode)
WHERE O.odate >= '2016-01-01' AND O.odate < '2017-01-01' AND P.ptype = 'BOOK')
ORDER BY custid;