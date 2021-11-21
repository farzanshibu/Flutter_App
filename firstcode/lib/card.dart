import 'package:flutter/material.dart';
import 'package:firstcode/screen2.dart' as s2;
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CardBlock extends StatefulWidget {
  final String heading;
  final String subHeading;
  final String supportingText;
  final String cardImage;
  final String imdb;
  final String tralier;
  bool fav;

  CardBlock(
      {Key? key,
      required this.heading,
      required this.subHeading,
      required this.supportingText,
      required this.cardImage,
      required this.imdb,
      required this.tralier,
      required this.fav})
      : super(key: key);

  @override
  State<CardBlock> createState() => _CardBlockState();
}

class _CardBlockState extends State<CardBlock> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          margin: const EdgeInsets.only(top: 7, right: 25, left: 25, bottom: 7),
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    widget.heading,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    widget.subHeading,
                    style: const TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => setState(() => widget.fav = !widget.fav),
                  icon: widget.fav
                      ? const Icon(Icons.favorite, color: Colors.pink)
                      : const Icon(Icons.favorite_border),
                ),
              ),
              SizedBox(
                height: 500.0,
                child: Ink.image(
                  image: NetworkImage(widget.cardImage),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.supportingText,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(10),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          launchURL(widget.imdb);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: const Color(0xFFE7A14A),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 150.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "More Details",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(10),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  s2.TrailerWatch(link: widget.tralier)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: const Color(0xFFE7A14A),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 150.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Trailer",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

Future<void> launchURL(String imdb) async => await canLaunch(
      imdb,
    )
        ? await launch(imdb)
        : throw ('Could not launch $imdb');
