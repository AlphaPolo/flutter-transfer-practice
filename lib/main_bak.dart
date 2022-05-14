import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:subtitle_transfer/subtitle.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoPage(),
    );
  }
}

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  late YoutubePlayerController _controller;

  final List<Subtitle> subtitles = [
    Subtitle(
      id: 0,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 1,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 2,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 3,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 4,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 5,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 6,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 7,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 8,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 9,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 10,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 11,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 12,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 13,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 14,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 15,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 16,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 17,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 18,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
    Subtitle(
      id: 19,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '3tJUflhYIpo',
      params: const YoutubePlayerParams(
        startAt: const Duration(minutes: 1, seconds: 36),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: YoutubePlayerControllerProvider(
        // Passing controller to widgets below.

          controller: _controller,
          child: Align(
            alignment: Alignment.topCenter,
            // set max width to 720
            child: Container(
                width: 720,
                child: Column(
                  children: [
                    player,
                    Expanded(
                      child: ListView(
                        children: [
                        ],
                      ),
                    )
                  ],
                )
            ),
          )
      )
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '3tJUflhYIpo',
      params: const YoutubePlayerParams(
        startAt: const Duration(minutes: 1, seconds: 36),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.

      controller: _controller,
      child: Align(
        alignment: Alignment.topCenter,
        // set max width to 720
        child: Container(
            width: 720,
            child: Column(
              children: [
                player,
                Expanded(
                  child: ListView(
                    children: [
                    ],
                  ),
                )
              ],
            )
        ),
      )
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
