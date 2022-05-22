import 'package:flutter/material.dart';

class HoveringWidget extends StatefulWidget {
  final HoverAnimation hoverAnimation;
  final Widget? child;
  final Color? color;

  const HoveringWidget({Key? key, required this.hoverAnimation, this.color, this.child}) : super(key: key);

  @override
  _HoveringWidgetState createState() => _HoveringWidgetState();
}

class _HoveringWidgetState extends State<HoveringWidget> {

  final Color defaultColor = Colors.white;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: widget.hoverAnimation.duration,
      decoration: BoxDecoration(
        color: (isHover ? widget.color ?? defaultColor : defaultColor),
      ),
      child: InkWell(
          child: widget.child,
          onHover: (val) {
            setState(() {
              isHover = val;
            });
          }),
      /*val--->true when user brings in mouse
         val---> false when brings out his mouse*/
    );

  }
}

abstract class HoverAnimation {
  Duration duration;
  HoverAnimation(this.duration);
}

class BaseAnimation extends HoverAnimation {
  BaseAnimation(Duration duration) : super(duration);
}