create table if not exists  list_of_performes(
id SERIAL primary key,
artist_name VARCHAR(30) not null,
genre_id references list_of_genres(id) 
);


create table if not exists list_of_genres(
id SERIAl primary key,
genres_name VARCHAR(30) not null
);

create table if not exists album_list(
id SERIAL primary key,
artists_id INTEGER references list_of_performes(id),
album_name VARCHAR(50),
release_date INTEGER
);

create table if not exists track_list(
id SERIAL primary key,
album_id INTEGER references album_list(id),
track_name VARCHAR(50),
track_duration INTEGER
);