import 'package:intl/intl.dart';
// import 'package:srt_parser/srt_parser.dart';
import 'package:subtitle_transfer/subtitle.dart';

class SRT_Util {

  static int parseToMillisecond(String text) {
      final timeStr = text;
      final format = DateFormat('HH:mm:ss.S');
      final dt = format.parse(timeStr, true);
      return dt.millisecondsSinceEpoch;
  }
  // export const combineSRTtoIntervalTree = (SRT_CN: string, SRT_EN: string) => {
  // let result_cn = parser.fromSrt(SRT_CN);
  // let result_en = parser.fromSrt(SRT_EN);
  // // console.log("Result", result);
  //
  // let array: Subtitle[] = [];
  // let intervalTree = new DataIntervalTree<Subtitle>();
  // result_cn.forEach((value: any, index: number) => {
  // let subtitleEn = result_en[index];
  // const subtitle: Subtitle = {
  // id: value.id,
  // native: value.text,
  // foreign: (subtitleEn != null) ? subtitleEn.text: '',
  // start: parseToMiliseconds(value.startTime),
  // end: parseToMiliseconds(value.endTime),
  // };
  //
  // array.push(subtitle);
  // intervalTree.insert(subtitle.start, subtitle.end, subtitle);
  // });
  // return { tree: intervalTree, data: array } ;
  // }

  // static combineSRT(String srt_cn, String srt_en) {
  //   var result_cn = parseSrt(srt_cn);
  //   var result_en = parseSrt(srt_en);
  //   var array = <MySubtitle>[];
  //
  //   result_cn.asMap().forEach((index, value) {
  //     Subtitle subtitleEn = result_en[index];
  //     MySubtitle sub = MySubtitle(
  //         id: value.id,
  //         native: value.rawLines.join(""),
  //         foreign: subtitleEn.rawLines.join(""),
  //     );
  //     array.add(sub);
  //   });
  //   print(array);
  // }
}
