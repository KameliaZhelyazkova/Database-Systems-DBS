SELECT I.invid
FROM Invoices I
WHERE I.amount = (SELECT CAST(SUM(D.qty*P.price)*1.2 AS NUMERIC(8,2))
                  FROM (Orders O Join Details D ON O.ordid = D.ordid)
                  JOIN
                  Products P ON D.pcode = P.pcode
                  WHERE I.ordid = O.ordid
                  GROUP BY O.ordid);