select genres_name ,count(list_of_performes.id) from music_base.list_of_genres
join music_base.genres_performes on music_base.list_of_genres.id = music_base.genres_performes.genres_id
join music_base.list_of_performes on genres_performes.performes_id = list_of_performes.id
group by music_base.list_of_genres.genres_name
;


select album_name al_n, count(track_list.track_duration) from music_base.album_list
join music_base.track_list  on music_base.album_list.id = music_base.track_list.album_id
where music_base.album_list.release_date  between 2019 and 2020
group by music_base.album_list.album_name
;

select album_id,album_name,avg(track_list.track_duration) from music_base.album_list
join music_base.track_list  on music_base.album_list.id = music_base.track_list.album_id
group by album_id, album_name
;

select lop.id , artist_name from music_base.list_of_performes lop
join music_base.album_performes ap on ap.artist_id = lop.id 
join music_base.album_list al on ap.album_id = al.id 
where al.release_date  != 2020
;

select name_compilation from music_base.compilation com
join music_base.compilation_track ct on com.id = ct.compilation_id 
join music_base.track_list tl on ct.track_id = tl.id 
join music_base.album_list al on al.id = tl.album_id 
join music_base.album_performes ap on al.id = ap.album_id
join music_base.list_of_performes lop on lop.id = ap.artist_id 
where lop.artist_name = 'Eminem'
;

select album_name from music_base.album_list al 
join music_base.album_performes ap on ap.album_id = al.id 
join music_base.list_of_performes lop on lop.id = ap.artist_id 
join music_base.genres_performes gp on lop.id = gp.performes_id 
join music_base.list_of_genres log2 on log2.id = gp.genres_id 
group by al.id , al.album_name
having count(gp.genres_id) > 1
; 


select id, track_name from music_base.track_list tl 
where tl.id  not in (select track_id from music_base.compilation_track ct)
;

select lop.id , artist_name from music_base.list_of_performes lop 
join music_base.album_performes ap  on ap.artist_id = lop.id 
join music_base.album_list al on al.id = ap.album_id 
join music_base.track_list tl on tl.album_id = ap.album_id
where tl.track_duration = (select min(track_duration) from music_base.track_list tl2)
;

select distinct album_name from music_base.album_list as a 
join music_base.track_list as t on t.album_id = a.id
where t.album_id in (
    select album_id
    from music_base.track_list tl 
    group by tl.album_id 
    having count(id) = (
        select count(id)
        from music_base.track_list tl2 
        group by tl2.album_id
        order by count
        limit 1
    )
)
order by a.album_name 