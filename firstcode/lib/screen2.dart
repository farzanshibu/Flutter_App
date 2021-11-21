import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt;

// ignore: must_be_immutable
class TrailerWatch extends StatelessWidget {
  String link;
  TrailerWatch({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: TralierPag(link: link),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class TralierPag extends StatefulWidget {
  final String link;
  const TralierPag({Key? key, required this.link}) : super(key: key);

  @override
  _TralierPagState createState() => _TralierPagState();
}

class _TralierPagState extends State<TralierPag> {
  late yt.YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = yt.YoutubePlayerController(
      initialVideoId: widget.link,
      flags: const yt.YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        controlsVisibleAtStart: true,
      ),
    );
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return yt.YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      onReady: () {
        // ignore: avoid_print
        print('Player is ready.');
      },
    );
  }
}
