import 'dart:async';

import 'package:flutter/material.dart';
import 'package:subtitle_transfer/utils/SRT_util.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideo extends StatefulWidget {
  final Function(int)? onTime;
  const YoutubeVideo({Key? key, this.onTime}) : super(key: key);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '3tJUflhYIpo',
      params: const YoutubePlayerParams(
      ),
    );
    // var future = new Future.delayed(const Duration(milliseconds: 10), doStuffCallback);
    _sub = _controller.listen((event) {
      // print('isReady: ${event.isReady}, state: ${event.playerState}, currentTime: ${event.position.inMilliseconds}');
      widget.onTime?.call(event.position.inMilliseconds);
    });

  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame(aspectRatio: 16 / 9,);

    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: player
    );
    _controller.value.position;
  }

  @override
  void dispose() {
    print("dispose");
    _sub.cancel();
    _controller.close();
    super.dispose();
  }

}

class StateLessVideo extends StatelessWidget {

  final YoutubePlayerController _controller;

  const StateLessVideo(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame(aspectRatio: 16 / 9,);

    return YoutubePlayerControllerProvider(
        controller: _controller,
        child: player
    );
  }

}
