

import 'package:intl/intl.dart';

class SRT_Util {

  static int parseToMilisecond(String text) {
      final timeStr = text;
      final format = DateFormat('HH:mm:ss.S');
      final dt = format.parse(timeStr, true);
      return dt.millisecondsSinceEpoch;
  }
}
