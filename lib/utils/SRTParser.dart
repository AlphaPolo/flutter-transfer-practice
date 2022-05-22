import 'package:srt_parser/srt_parser.dart';
import 'package:subtitle_transfer/subtitle.dart';

class SRTParser {

  static List<MySubtitle> combineSRT(String srt_cn, String srt_en) {
    final cn = parse(srt_cn);
    final en = parse(srt_en);
    var result = <MySubtitle>[];
    cn.asMap().forEach((index, value) {
      final subtitleEn = en[index];
      final subtitle = MySubtitle(
        id: value.id,
        native: value.native,
        foreign: subtitleEn.native ?? "",
        start: value.start,
        end: value.end
      );
      result.add(subtitle);
    });

    return result;
  }

  static List<MySubtitle> parse(String srt) {
    List<Subtitle> subtitles = parseSrt(srt);
    var result = subtitles.map((item) => MySubtitle(
      id: item.id,
      start: item.range.begin,
      end: item.range.end,
      native: item.rawLines.join(""),
    )).toList();
    return result;
  }
}
