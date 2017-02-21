SELECT P.ptype, COUNT(DISTINCT O.ordid)
FROM (Orders O JOIN Details D ON O.ordid = D.ordid) NATURAL JOIN Products P
WHERE P.ptype = ALL(SELECT P.ptype
                      FROM (Orders O2 JOIN Details D ON O2.ordid = D.ordid) NATURAL JOIN Products P
                      WHERE O2.ordid = O.ordid)
GROUP BY P.ptype;
