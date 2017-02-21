SELECT Alb.title, A.aname
FROM Artists A JOIN Albums Alb ON A.aname = Alb.artist
WHERE A.atype = 'BAND' AND NOT EXISTS (SELECT 1
                                       FROM Artists Art JOIN Albums Alb1 ON Art.aname = ALb1.artist
                                       WHERE Alb1.ryear < Alb.ryear AND Alb1.rating >= Alb.rating AND A.aname = Art.aname);
