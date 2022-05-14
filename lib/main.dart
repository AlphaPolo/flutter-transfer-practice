import 'dart:async';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:flutter/material.dart';
import 'package:subtitle_transfer/subtitle.dart';
import 'package:subtitle_transfer/subtitle_card.dart';
import 'package:subtitle_transfer/youtube_video.dart';
import 'package:youtube_player_iframe/src/player_value.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const address = "https://subtitlevideo-default-rtdb.firebaseio.com/SRT";

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
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '3tJUflhYIpo',
    params: const YoutubePlayerParams(
    ),
  );

  final List<Subtitle> subtitles = [
    Subtitle(
      id: 0,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 1000,
      end: 2000,
    ),
    Subtitle(
      id: 1,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 2000,
      end: 3000,
    ),
    Subtitle(
      id: 2,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 3000,
      end: 4000,
    ),
    Subtitle(
      id: 3,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 4000,
      end: 5000,
    ),
    Subtitle(
      id: 4,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 5000,
      end: 6000,
    ),
    Subtitle(
      id: 5,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 6000,
      end: 7000,
    ),
    Subtitle(
      id: 6,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 7000,
      end: 8000,
    ),
    Subtitle(
      id: 7,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 8000,
      end: 9000,
    ),
    Subtitle(
      id: 8,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 9000,
      end: 10000,
    ),
    Subtitle(
      id: 9,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 10000,
      end: 11000,
    ),
    Subtitle(
      id: 10,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 11000,
      end: 12000,
    ),
    Subtitle(
      id: 11,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 12000,
      end: 13000,
    ),
    Subtitle(
      id: 12,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 13000,
      end: 14000,
    ),
    Subtitle(
      id: 13,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 14000,
      end: 15000,
    ),
    Subtitle(
      id: 14,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 15000,
      end: 16000,
    ),
    Subtitle(
      id: 15,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 16000,
      end: 17000,
    ),
    Subtitle(
      id: 16,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 17000,
      end: 18000,
    ),
    Subtitle(
      id: 17,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 18000,
      end: 19000,
    ),
    Subtitle(
      id: 18,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 19000,
      end: 20000,
    ),
    Subtitle(
      id: 19,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 20000,
      end: 21000,
    ),
  ];

  late StreamSubscription<YoutubePlayerValue> _sub;
  late AutoScrollController controller;

  int _currentIndex = -1;

  @override
  void initState() {
    super.initState();

    controller = AutoScrollController(
      //add this for advanced viewport boundary. e.g. SafeArea
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),

      //choose vertical/horizontal
      axis: Axis.vertical,

      //this given value will bring the scroll offset to the nearest position in fixed row height case.
      //for variable row height case, you can still set the average height, it will try to get to the relatively closer offset
      //and then start searching.
      suggestedRowHeight: 200
    );

    _sub = _controller.listen((event) {
      var current = event.position.inMilliseconds;
      print("state: ${event.playerState}, current: $current");
      var index = subtitles.indexWhere((element) => element.start <= current && current < element.end);
      if(index != -1) {
        controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
        setState(() {
          _currentIndex = index;
        });
      }

    });

  }

  @override
  void dispose() {
    _sub.cancel();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        // appBar: AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
        body: Align(
          alignment: Alignment.topCenter,
          // set max width to 720
          child: SizedBox(
              width: 720,
              child: Column(
                children: [
                  StateLessVideo(_controller),
                  // YoutubeVideo(
                  //     onTime: (int time) => {
                  //       print(time)
                  //     }
                  // ),
                  Expanded(
                    child: ListView.separated(
                        controller: controller,
                        itemCount: subtitles.length,
                        itemBuilder: (BuildContext context, int index) => _wrapScrollTag(index: index, child: SubtitleCard(subtitle: subtitles[index], isActive: _currentIndex == index,)),
                        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1,),
                    )
                  )
                ],
              )
          ),
    ));
  }

  Widget wrapItem(SubtitleCard card) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide()),
      ),
      child: card,
    );
  }

  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}
