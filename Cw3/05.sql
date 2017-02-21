SELECT Alb.title, Alb.artist, Alb.tracks - COUNT(T.track_number)
FROM Albums Alb LEFT JOIN Tracks T ON Alb.title = T.album_title AND Alb.artist = T.album_artist
GROUP BY Alb.title, Alb.artist, Alb.tracks
HAVING Alb.tracks > COUNT(T.track_number);