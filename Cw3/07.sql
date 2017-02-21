SELECT Art.aname
FROM Artists Art
WHERE ((SELECT COUNT(Alb.title)
        FROM Artists Art1 JOIN Albums Alb ON Art1.aname = Alb.artist
        WHERE Alb.rtype='LIVE' AND Art1.aname = Art.aname)
     + (SELECT COUNT(Alb1.title)
        FROM Artists Art2 JOIN Albums Alb1 ON Art2.aname = Alb1.artist
        WHERE Art2.aname = Art.aname AND Alb1.rtype='COMPILATION')
     > (SELECT COUNT(Alb2.title)
        FROM Artists Art3 JOIN Albums Alb2 ON Art3.aname = Alb2.artist
        WHERE Alb2.rtype = 'STUDIO' AND Art3.aname = Art.aname));