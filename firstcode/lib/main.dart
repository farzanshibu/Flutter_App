import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Movie Rating'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Movie Rating'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isFavorited = [false, false, false, false, false, false, false];
  List<String> movieNames = [
    'Avengers: Infinity War',
    'Avengers: Endgame',
    'Avengers: Age of Ultron',
    'Shang-Chi and The Legend of The Ten Rings ',
    'Spider-Man: Far from Home',
    'Spider-Man: Homecoming',
    'Black Widow'
  ];
  List<String> movieRatings = [
    '8.4⭐/10',
    '8.4⭐/10',
    '7.3⭐/10',
    '7.7⭐/10',
    '7.4⭐/10',
    '7.4⭐/10',
    '6.7⭐/10'
  ];
  List<String> movieDescriptions = [
    'The Avengers must stop Thanos, an intergalactic warlord, from getting his hands on all the infinity stones',
    'After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance',
    'Tony Stark builds an artificial intelligence system named Ultron with the help of Bruce Banner.',
    'Martial-arts master Shang-Chi confronts the past he thought he left behind when he\'s drawn into the web of the mysterious Ten Rings organization.',
    'Peter Parker, the beloved superhero Spider-Man, faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins.',
    'Peter Parker tries to stop the Vulture from selling weapons made with advanced Chitauri technology while trying to balance his life as an ordinary high school student.',
    'Natasha Romanoff, a former KGB spy, is shocked to find out that her ex handler, General Dreykov, is still alive. While evading capture by Taskmaster, she is forced to confront her dark past.'
  ];
  List<String> movieInfos = [
    'https://www.imdb.com/title/tt4154756/',
    'https://www.imdb.com/title/tt4154796/',
    'https://www.imdb.com/title/tt2395427/',
    'https://www.imdb.com/title/tt9376612/',
    'https://www.imdb.com/title/tt6320628/',
    'https://www.imdb.com/title/tt2250912/',
    'https://www.imdb.com/title/tt3480822/',
  ];
  List<String> movieImages = [
    'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNTliYjlkNDQtMjFlNS00NjgzLWFmMWEtYmM2Mzc2Zjg3ZjEyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg',
    'https://www.sonypictures.com/sites/default/files/styles/max_560x840/public/title-key-art/Spider-Man-FarFromHome-rating.jpg?itok=CGe-MMMn',
    'https://static.wikia.nocookie.net/ironman/images/1/14/1_xlqPtRndV-lzCglYEV6L8g.jpeg/revision/latest?cb=20191213153502',
    'https://images-na.ssl-images-amazon.com/images/I/914MHuDfMSL.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(0),
                  buildCard(1),
                  buildCard(2),
                  buildCard(3),
                  buildCard(4),
                  buildCard(5),
                  buildCard(6),
                ],
              )),
        ));
  }

  Card buildCard(index) {
    var heading = Text(
      movieNames[index],
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
    var subheading = Text(
      movieRatings[index],
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
    var cardImage = NetworkImage(movieImages[index]);
    var supportingText = Text(
      movieDescriptions[index],
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    );
     void  _launchURL() async =>
    await canLaunch(movieInfos[index],) ? await launch(movieInfos[index]) : throw 'Could not launch $movieInfos[index]';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: heading,
              subtitle: subheading,
              trailing: IconButton(
                onPressed: () =>
                    setState(() => isFavorited[index] = !isFavorited[index]),
                icon: isFavorited[index]
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border),
              ),
            ),
            Container(
              height: 500.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: supportingText,
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: _launchURL,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      color: const Color(0xFFE7A14A),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "More Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
