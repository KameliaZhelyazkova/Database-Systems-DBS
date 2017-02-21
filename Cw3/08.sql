SELECT COUNT(DISTINCT Art.aname)
FROM Artists Art JOIN Albums Alb ON Art.aname = Alb.artist
WHERE Art.country = 'USA' AND Art.atype = 'BAND'
  AND EXISTS (SELECT *
            FROM Artists Art1 JOIN Albums Alb1 ON Art1.aname = Alb1.artist
            WHERE Alb.rating = 5 AND  Art.aname = Art1.aname
              AND Alb.ryear = (SELECT Alb2.ryear
                               FROM Artists Art2 JOIN Albums Alb2 ON Art2.aname = Alb2.artist
                               WHERE Art2.aname = Art.aname
                               ORDER BY Alb2.ryear ASC
                               LIMIT 1));
