WITH subtable(custid, ptype, quantity) AS (
    SELECT C.custid, P.ptype,(SUM(D.qty)) AS quantity
    FROM  (Customers C JOIN Orders O ON C.custid = O.ocust) NATURAL JOIN (Details D JOIN Products P ON D.pcode = P.pcode)
    GROUP BY C.custid, P.ptype
)
SELECT S.ptype, S.custid
FROM subtable S
WHERE S.quantity = (SELECT MAX(S1.quantity)
                    FROM subtable S1
                    WHERE S1.ptype = S.ptype);
