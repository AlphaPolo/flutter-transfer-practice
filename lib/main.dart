import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutter/material.dart';
import 'package:subtitle_transfer/components/hover_widget.dart';
import 'package:subtitle_transfer/subtitle.dart';
import 'package:subtitle_transfer/subtitle_card.dart';
import 'package:subtitle_transfer/youtube_video.dart';
import 'package:youtube_player_iframe/src/player_value.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
import 'utils/SRTParser.dart';

const address = "https://subtitlevideo-default-rtdb.firebaseio.com/SRT";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

  List<MySubtitle> subtitles = [
    MySubtitle(
      id: 0,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 1000,
      end: 2000,
    ),
    MySubtitle(
      id: 1,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 2000,
      end: 3000,
    ),
    MySubtitle(
      id: 2,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 3000,
      end: 4000,
    ),
    MySubtitle(
      id: 3,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 4000,
      end: 5000,
    ),
    MySubtitle(
      id: 4,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 5000,
      end: 6000,
    ),
    MySubtitle(
      id: 5,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 6000,
      end: 7000,
    ),
    MySubtitle(
      id: 6,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 7000,
      end: 8000,
    ),
    MySubtitle(
      id: 7,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 8000,
      end: 9000,
    ),
    MySubtitle(
      id: 8,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 9000,
      end: 10000,
    ),
    MySubtitle(
      id: 9,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 10000,
      end: 11000,
    ),
    MySubtitle(
      id: 10,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 11000,
      end: 12000,
    ),
    MySubtitle(
      id: 11,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 12000,
      end: 13000,
    ),
    MySubtitle(
      id: 12,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 13000,
      end: 14000,
    ),
    MySubtitle(
      id: 13,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 14000,
      end: 15000,
    ),
    MySubtitle(
      id: 14,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 15000,
      end: 16000,
    ),
    MySubtitle(
      id: 15,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 16000,
      end: 17000,
    ),
    MySubtitle(
      id: 16,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 17000,
      end: 18000,
    ),
    MySubtitle(
      id: 17,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 18000,
      end: 19000,
    ),
    MySubtitle(
      id: 18,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 19000,
      end: 20000,
    ),
    MySubtitle(
      id: 19,
      native: "Test Test Test Test Test Test",
      foreign: "Test Test Test Test Test Test",
      start: 20000,
      end: 21000,
    ),
  ];
  final storage = FirebaseStorage.instance.ref().child("SRT");

  late StreamSubscription<YoutubePlayerValue> _sub;
  late ItemScrollController _scrollController;

  int _currentIndex = -1;

  @override
  void initState() {
    super.initState();
    downloadData("3tJUflhYIpo");

    _scrollController = ItemScrollController();

    _sub = _controller.listen((event) {
      var current = event.position.inMilliseconds;
      // print("state: ${event.playerState}, current: $current");
      var index = subtitles.indexWhere((element) => (element.start <= current && current < element.end));

      // TODO check process this times
      if(index != -1 && index != _currentIndex) {
        setState(() {
          _currentIndex = index;
          _scrollController.scrollTo(index: _currentIndex, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
        });
      }

    });

  }

  void downloadData(String path) async {
    var ref_cn = storage.child(path).child('SRT_CN');
    var ref_en = storage.child(path).child('SRT_EN');
    var downloadedData  =  await Future.wait([ref_cn.getData(), ref_en.getData()]);

    final srt_cn = utf8.decode(downloadedData[0] ?? []);

    final srt_en = utf8.decode(downloadedData[1] ?? []);

    var result = SRTParser.combineSRT(srt_cn, srt_en);
    setState(() {
      subtitles = result;
    });
    // SubtitleRegexObject.custom(r"(\d+)\n(\d{1,2}:\d{2}:\d{2},\d{1,3}) --> (\d{1,2}:\d{2}:\d{2},\d{1,3})");

    // var cn = parser.parseSRT(srt_cn);
    // cn.
    // SRT_Util.combineSRT(srt_cn, srt_en);
  }

  @override
  void dispose() {
    _sub.cancel();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (0 < _currentIndex && _currentIndex < subtitles.length) {
    //
    // }

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
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      itemCount: subtitles.length,
                      itemBuilder: (context, index) {

                        return HoveringWidget(
                            hoverAnimation: BaseAnimation(const Duration(milliseconds: 300)),
                            child: SubtitleCard(key: Key(subtitles[index].id.toString()),
                            subtitle: subtitles[index],
                            isActive: _currentIndex == index),
                            color: Colors.grey
                        );
                      },
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

  // Widget _wrapScrollTag({required int index, required Widget child}) =>
  //     AutoScrollTag(
  //       key: ValueKey(index),
  //       controller: controller,
  //       index: index,
  //       child: child,
  //       highlightColor: Colors.black.withOpacity(0.1),
  //     );
}
