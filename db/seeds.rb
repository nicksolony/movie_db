#create genres

Genre.create(id: 1, name: 'Comedy')
Genre.create(id: 2, name: 'Crime')
Genre.create(id: 3, name: 'Drama')
Genre.create(id: 4, name: 'Action')
Genre.create(id: 5, name: 'Fantasy')
Genre.create(id: 6, name: 'Adventure')
Genre.create(id: 7, name: 'Adventure')
Genre.create(id: 8, name: 'Sci-Fi')
Genre.create(id: 9, name: 'Romance')


#create People
Person.create(name: 'Rian Johnson', dob: '1973-12-17')
Person.create(name: 'Daniel Craig', dob: '1968-03-02')
Person.create(name: 'Chris Evans', dob: '1981-06-13')
Person.create(name: 'Ana de Armas', dob: '1988-04-30')
Person.create(name: 'Jamie Lee Curtis', dob: '1958-11-22')
Person.create(name: 'Michael Shannon', dob: '1974-08-07')
Person.create(name: 'Don Johnson', dob: '1949-12-15')
Person.create(name: 'Mark Hamill', dob: '1951-09-25')
Person.create(name: 'Carrie Fisher', dob: '1956-10-21')
Person.create(name: 'Adam Driver', dob: '1983-11-19')
Person.create(name: 'Daisy Ridley', dob: '1992-04-10')
Person.create(name: 'John Boyega', dob: '1992-03-17')
Person.create(name: 'Oscar Isaac', dob: '1979-03-09')
Person.create(name: 'Joe Johnston', dob: '1950-05-13')
Person.create(name: 'Christopher Markus', dob: '1970-01-02')
Person.create(name: 'Hayley Atwell', dob: '1982-04-05')
Person.create(name: 'Sebastian Stan', dob: '1982-08-13')
Person.create(name: 'Tommy Lee Jones', dob: '1946-09-15')
Person.create(name: 'Hugo Weaving', dob: '1960-04-04')
Person.create(name: 'Stanley Tucci', dob: '1960-11-11')
Person.create(name: 'Ronald Bass', dob: '1942-03-26')
Person.create(name: 'Alice Eve', dob: '1982-02-06')
Person.create(name: 'Emma Fitzpatrick', dob: '1985-03-20')
Person.create(name: 'John Cullum', dob: '1930-03-02')
Person.create(name: 'Mark Kassen', dob: '1971-10-04')

#create Movies
Movie.create(id: 1, title: 'Knives Out', director_id: 1, writer_id: 1, release_date: 2019)
Movie.create(id: 2, title: 'Star Wars: Episode VIII - The Last Jedi', director_id: 1, writer_id: 1, release_date: 2017)
Movie.create(id: 3, title: 'Captain America: The First Avenger', director_id: 14, writer_id: 15, release_date: 2011)
Movie.create(id: 4, title: 'Before We Go', director_id: 3, writer_id: 21, release_date: 2014)

#create MovieGenres

MovieGenre.create(movie_id: 1, genre_id: 1)
MovieGenre.create(movie_id: 1, genre_id: 2)
MovieGenre.create(movie_id: 1, genre_id: 3)
MovieGenre.create(movie_id: 2, genre_id: 4)
MovieGenre.create(movie_id: 2, genre_id: 5)
MovieGenre.create(movie_id: 2, genre_id: 6)
MovieGenre.create(movie_id: 3, genre_id: 4)
MovieGenre.create(movie_id: 3, genre_id: 7)
MovieGenre.create(movie_id: 3, genre_id: 8)
MovieGenre.create(movie_id: 4, genre_id: 9)
MovieGenre.create(movie_id: 4, genre_id: 1)
MovieGenre.create(movie_id: 4, genre_id: 3)

#characters
Character.create(movie_id: 1, actor_id: 2, name: 'Benoit Blanc')
Character.create(movie_id: 1, actor_id: 3, name: 'Ransom Drysdale')
Character.create(movie_id: 1, actor_id: 4, name: 'Marta Cabrera')
Character.create(movie_id: 1, actor_id: 5, name: 'Linda Drysdale')
Character.create(movie_id: 1, actor_id: 6, name: 'Walt Thrombey')
Character.create(movie_id: 1, actor_id: 7, name: 'Richard Drysdale')
Character.create(movie_id: 2, actor_id: 8, name: 'Luke Skywalker / Dobbu Scay')
Character.create(movie_id: 2, actor_id: 9, name: 'Leia Organa')
Character.create(movie_id: 2, actor_id: 10, name: 'Kylo Ren')
Character.create(movie_id: 2, actor_id: 11, name: 'Rey')
Character.create(movie_id: 2, actor_id: 12, name: 'Finn')
Character.create(movie_id: 2, actor_id: 13, name: 'Poe Dameron')
Character.create(movie_id: 3, actor_id: 3, name: 'Captain America / Steve Rogers')
Character.create(movie_id: 3, actor_id: 16, name: 'Peggy Carter')
Character.create(movie_id: 3, actor_id: 17, name: 'James Buchanan “Bucky” Barnes')
Character.create(movie_id: 3, actor_id: 18, name: 'Colonel Chester Phillips')
Character.create(movie_id: 3, actor_id: 19, name: 'Johann Schmidt / Red Skull')
Character.create(movie_id: 3, actor_id: 20, name: 'Dr. Abraham Erskine')
Character.create(movie_id: 4, actor_id: 3, name: 'Nick')
Character.create(movie_id: 4, actor_id: 22, name: 'Brooke')
Character.create(movie_id: 4, actor_id: 23, name: 'Hannah')
Character.create(movie_id: 4, actor_id: 24, name: 'Harry')
Character.create(movie_id: 4, actor_id: 25, name: 'Danny')
