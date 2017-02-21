SELECT CAST(AVG(albFilter.totalLength) AS INT)/60, CAST(AVG(albFilter.totalLength) AS INT)%60
FROM (SELECT SUM(T.track_length) AS totalLength
     FROM Albums Alb JOIN Tracks T ON Alb.title = T.album_title AND Alb.artist = T.album_artist
     WHERE Alb.ryear >= 1990 AND Alb.ryear <= 1999
     GROUP BY Alb.title, Alb.artist
     HAVING Alb.tracks = COUNT(T.track_number) AND COUNT (T.track_number) >= 10) AS albFilter;