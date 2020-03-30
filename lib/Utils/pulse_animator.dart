import 'package:flutter/material.dart';

class PulseAnimator extends StatefulWidget {
  PulseAnimator(
      {Key key,
      this.child,
      this.begin = 0.3,
      this.end = 1.0,
      this.duration = const Duration(milliseconds: 1000)})
      : super(key: key);

  @required
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;

  @override
  _PulseAnimatorState createState() => _PulseAnimatorState();
}

class _PulseAnimatorState extends State<PulseAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: TweenAndBack(begin: widget.begin, end: widget.end)
          .animate(_controller),
      child: widget.child,
    );
  }
}

class TweenAndBack<T> extends Tween<T> {
  TweenAndBack({T begin, T end}) : super(begin: begin, end: end);

  @override
  T lerp(double t) {
    return super.lerp(t);
  }
}
