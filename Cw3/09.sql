SELECT Filter.artist, CAST((SumFilteredAlb * 100.00 /Total) AS NUMERIC(5,2))
FROM (SELECT Alb.artist, COUNT(Alb.title) AS Total, SUM(CASE WHEN Alb.rating < 3 THEN 1 ELSE 0 END) as SumFilteredAlb
      FROM Artists Art JOIN Albums Alb ON Art.aname = Alb.artist
      GROUP BY Alb.artist) as Filter;