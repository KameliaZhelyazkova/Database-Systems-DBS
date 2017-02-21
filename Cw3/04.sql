SELECT Alb.title, Alb.artist, T.track_number
FROM Albums Alb JOIN Tracks T ON Alb.title = T.album_title AND  Alb.artist = T.album_artist
WHERE (Alb.rating = 4 OR Alb.rating = 5) AND Alb.ryear > 1995 AND T.track_length < (2*60 + 34);