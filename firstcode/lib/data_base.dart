class MovieInformations {
  String names;
  String ratings;
  String descriptions;
  String imdbLinks;
  String traliers;
  String images;
  bool isFavoriated;

  MovieInformations(this.names, this.ratings, this.descriptions, this.imdbLinks,
      this.traliers, this.images, this.isFavoriated);

  static List movieDetails = [
    MovieInformations(
        'Avengers: Infinity War',
        '8.4⭐/10',
        'The Avengers must stop Thanos, an intergalactic warlord, from getting his hands on all the infinity stones',
        'https://www.imdb.com/title/tt4154756/',
        '6ZfuNTqbHE8',
        'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg',
        false),
    MovieInformations(
        'Avengers: Endgame',
        '8.4⭐/10',
        'After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance',
        'https://www.imdb.com/title/tt4154796/',
        'd4KqqeDA7oY',
        'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
        false),
    MovieInformations(
        'Avengers: Age of Ultron',
        '7.3⭐/10',
        'Tony Stark builds an artificial intelligence system named Ultron with the help of Bruce Banner',
        'https://www.imdb.com/title/tt2395427/',
        '7WsyChQLEE0',
        'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_FMjpg_UX1000_.jpg',
        false),
    MovieInformations(
        'Shang-Chi and The Legend of The Ten Rings ',
        '7.7⭐/10',
        'Martial-arts master Shang-Chi confronts the past he thought he left behind when he\'s drawn into the web of the mysterious Ten Rings organization',
        'https://www.imdb.com/title/tt9376612/',
        '5bXk_hSg_Uc',
        'https://m.media-amazon.com/images/M/MV5BNTliYjlkNDQtMjFlNS00NjgzLWFmMWEtYmM2Mzc2Zjg3ZjEyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg',
        false),
    MovieInformations(
        'Spider-Man: Far from Home',
        '7.4⭐/10',
        'Peter Parker, the beloved superhero Spider-Man, faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins',
        'https://www.imdb.com/title/tt6320628/',
        'RUvhsuW2nUc',
        'https://www.sonypictures.com/sites/default/files/styles/max_560x840/public/title-key-art/Spider-Man-FarFromHome-rating.jpg?itok=CGe-MMMn',
        false),
    MovieInformations(
        'Spider-Man: Homecoming',
        '7.4⭐/10',
        'Peter Parker tries to stop the Vulture from selling weapons made with advanced Chitauri technology while trying to balance his life as an ordinary high school student.',
        'https://www.imdb.com/title/tt2250912/',
        '7wNU6mF9QgM',
        'https://static.wikia.nocookie.net/ironman/images/1/14/1_xlqPtRndV-lzCglYEV6L8g.jpeg/revision/latest?cb=20191213153502',
        false),
    MovieInformations(
        'Black Widow',
        '6.7⭐/10',
        'Natasha Romanoff, a former KGB spy, is shocked to find out that her ex handler, General Dreykov, is still alive. While evading capture by Taskmaster, she is forced to confront her dark past.',
        'https://www.imdb.com/title/tt3480822/',
        '7wNU6mF9QgM',
        'https://images-na.ssl-images-amazon.com/images/I/914MHuDfMSL.jpg',
        false)
  ];
}
