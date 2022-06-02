create table if not exists  list_of_performes(
id SERIAL primary key,
artist_name VARCHAR(30) not null
);


create table if not exists list_of_genres(
id SERIAl primary key,
genres_name VARCHAR(30) not null
);

create table if not exists album_list(
id SERIAL primary key,
album_name VARCHAR(50),
release_date INTEGER
);

create table if not exists track_list(
id SERIAL primary key,
album_id INTEGER references album_list(id),
track_name VARCHAR(50),
track_duration INTEGER
);

create table if not exists genres_performes(
genres_id integer references list_of_genres(id),
performes_id integer references list_of_performes(id),
constraint gen_perf primary key(performes_id, genres_id)
);

create table if not exists album_performes(
album_id integer references album_list(id),
artist_id integer references list_of_performes(id),
constraint alb_perf primary key (album_id, artist_id)
);

create table if not exists compilation(
id SERIAL primary key,
name_compilation varchar(50),
release_date integer
);

create table if not exists compilation_track(
track_id integer references track_list(id),
compilation_id integer references compilation(id),
constraint comp_track primary key (track_id, compilation_id)
);