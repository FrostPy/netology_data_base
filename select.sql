select album_name , release_date from music_base.album_list
where release_date = 2018
;

select track_name, track_duration from music_base.track_list
where track_duration = (select max(track_duration) from music_base.track_list)
;

select track_name from music_base.track_list
where track_duration  >= 3.5
;

select name_compilation from music_base.compilation
where release_date between 2018 and 2020
;

select artist_name from music_base.list_of_performes
where artist_name not like '%% %%'
;

select  track_name from music_base.track_list
where track_name  ilike '%%мой%%' 
or
track_name ilike  '%%my%%'
;