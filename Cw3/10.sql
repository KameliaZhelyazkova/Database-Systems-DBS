SELECT Art.aname
FROM Artists Art
WHERE NOT EXISTS (SELECT 1
                  FROM Albums Alb1 JOIN Albums Alb2 ON Alb1.artist = Alb2.artist
                  WHERE Alb1.ryear < Alb2.ryear AND Alb1.rtype = 'STUDIO' AND Alb2.rtype = 'STUDIO' AND Art.aname = Alb1.artist
                  GROUP BY Alb1.title
                  HAVING MIN(Alb2.ryear - Alb1.ryear) > 4);
