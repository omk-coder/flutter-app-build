import 'package:flutter/material.dart';

class CustomePageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  final time;

  CustomePageRoute({
    required this.child,
    this.direction = AxisDirection.right,
    this.time,
  }) : super(
          transitionDuration: Duration(seconds: time),
          reverseTransitionDuration: Duration(seconds: time),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBegainOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset getBegainOffset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }
}

class CustomePageLRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomePageLRoute({
    required this.child,
    this.direction = AxisDirection.right,
  }) : super(
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBegainOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset getBegainOffset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }
}
