SELECT Alb.title, Art.aname
FROM Albums Alb JOIN Artists Art ON Art.aname = Alb.artist
WHERE Alb.rtype = 'LIVE' AND Art.country = 'GBR' AND Alb.rating > (SELECT AVG(Alb1.rating)
                                                                  FROM Albums Alb1 JOIN Artists Art1 ON Art1.aname = Alb1.artist
                                                                  WHERE Alb.ryear = Alb1.ryear);
