SELECT DISTINCT Art.aname
FROM Artists Art INNER JOIN Albums Alb ON Art.aname = Alb.artist
WHERE Alb.rtype = 'STUDIO' AND NOT EXISTS (SELECT 1
                                           FROM Albums Alb1
                                           WHERE Art.aname = Alb1.artist AND Alb1.rtype <> 'STUDIO');
