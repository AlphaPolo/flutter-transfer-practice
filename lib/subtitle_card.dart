
import 'package:flutter/material.dart';
import 'package:subtitle_transfer/subtitle.dart';

class SubtitleCard extends StatelessWidget {
  final MySubtitle subtitle;
  final bool isActive;

  const SubtitleCard({Key? key, required this.subtitle, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: isActive ? const BoxDecoration (
          color: Colors.red,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))
      ) : const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                onPressed: () {},
                child: const Icon(Icons.play_circle_fill),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        subtitle.native ?? "",
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 6),
                      Text(
                        subtitle.foreign ?? "",
                        style: const TextStyle(fontSize: 18.0),
                      )
                    ]),
              ),
              Column(children: [
                FlatButton(
                  onPressed: () {},
                  child: const Icon(Icons.repeat),
                ),
              ]),
            ]),
      ),
    );
  }
}
