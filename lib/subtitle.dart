import 'package:flutter/material.dart';

class Subtitle {
  int? id;
  String? native;
  String? foreign;
  int start;
  int end;

  Subtitle({ this.id, this.native, this.foreign, this.start = 0, this.end = 0});
}