import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firstcode/data_base.dart' as db;
import 'package:firstcode/card.dart' as card;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Movie Rating'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: db.MovieInformations.movieDetails.length,
            itemBuilder: (BuildContext context, index) {
              return card.CardBlock(
                  heading: db.MovieInformations.movieDetails[index].names,
                  subHeading: db.MovieInformations.movieDetails[index].ratings,
                  supportingText:
                      db.MovieInformations.movieDetails[index].descriptions,
                  imdb: db.MovieInformations.movieDetails[index].imdbLinks,
                  cardImage: db.MovieInformations.movieDetails[index].images,
                  fav: db.MovieInformations.movieDetails[index].isFavoriated,
                  tralier: db.MovieInformations.movieDetails[index].traliers);
            }));
  }
}
