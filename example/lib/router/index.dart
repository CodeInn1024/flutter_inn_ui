/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 15:00:11
*/

import 'package:lqrui/common/common.dart';

export './basics.dart';
export './style.dart';
export './extension.dart';

Future lqrRouter132(
  path, {
  maintainState: true,
  Future Function() beforeEach,
}) async {
  print('$path');
  if (beforeEach != null) await beforeEach();
  return await Navigator.push(
    Lqr.ui.scaffoldCtx,
    AnimationRoute132(path, maintainState),
  );
}

class AnimationRoute132 extends PageRouteBuilder {
  final Widget widget;
  final bool maintainState;
  AnimationRoute132(this.widget, this.maintainState)
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