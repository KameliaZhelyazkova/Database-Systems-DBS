SELECT SumQuantity.ptype, (CAST(AVG(PerOrderEachTypeQuantity) AS NUMERIC(8,2)))
FROM (SELECT O.ordid, P.ptype, SUM(CAST(D.qty AS NUMERIC(8,2))) AS PerOrderEachTypeQuantity
      FROM (Orders O JOIN Details D ON O.ordid = D.ordid) JOIN Products P ON D.pcode = P.pcode
      GROUP BY P.ptype, O.ordid) AS SumQuantity
GROUP BY SumQuantity.ptype;