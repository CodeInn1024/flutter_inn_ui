/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-16 10:17:00
*/

import 'package:flutter_lqrui/lqr_common.dart';

Future lqrRouter(
  LqrRouterClass path, {
  maintainState: true,
  Future Function() beforeEach,
}) async {
  print('${path.name}');
  if (beforeEach != null) await beforeEach();
  return await Navigator.push(
    Lqr.ui.scaffoldCtx,
    AnimationRoute(path.router, maintainState),
  );
}

class AnimationRoute extends PageRouteBuilder {
  final Widget widget;
  final bool maintainState;
  AnimationRoute(this.widget, this.maintainState)
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) {
            return widget;
          },
          maintainState: maintainState,
          transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
              child: child,
            );
          },
        );
}

class LqrRouter {
  /// 跳转页面并销毁当前页面或移除所有的页面直到predicate
  static pushAndRemoveUntil(Widget route, {context, String predicate}) => Navigator.of(context ?? Lqr.ui.scaffoldCtx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => route),
        // predicate == null ? false : ModalRoute.withName(predicate),
        (Route<dynamic> route) {
          print(route.settings.name);
          return true;
        },
      );
  static push(Widget route, {context, String predicate}) => Navigator.of(context).pushNamed("new_page", arguments: LqrRouterClass(route));
}

class LqrRouterClass {
  final String name;
  final String title;
  final List<String> roles;
  final Widget router;
  LqrRouterClass(this.router, {this.name = '', this.roles = const [], this.title = ''});
}
