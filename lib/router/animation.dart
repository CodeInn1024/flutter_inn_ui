import 'package:flutter_lqrui/lqr_common.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LqrRouterAnimation {
  static Route cupertino(widget) => CupertinoPageRoute(
        builder: (BuildContext context) => widget,
        settings: new RouteSettings(
          name: widget.toStringShort(),
          isInitialRoute: false,
        ),
      );

  static Route material(widget) => MaterialPageRoute(
        builder: (BuildContext context) => widget,
        settings: new RouteSettings(
          name: widget.toStringShort(),
          isInitialRoute: false,
        ),
      );
}

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({this.page})
      : super(
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(animation),
            child: child,
          ),
        );
}

class AnimationRoute extends PageRouteBuilder {
  final Widget widget;
  final bool maintainState;
  AnimationRoute(this.widget, this.maintainState)
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) => widget,
          maintainState: maintainState,
          transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) => SlideTransition(
            position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(
              CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn),
            ),
            child: child,
          ),
        );
}
