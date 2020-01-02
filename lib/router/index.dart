/*
 * @Description: 路由
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:44:57
*/

import 'package:flutter_lqrui/lqr_common.dart';

/// [MaterialApp] 添加 `navigatorKey: LqrRouter.navKey`
///
/// 设置全局路由默认过度动画 `LqrRouter.transition = LqrRouterTransition.cupertino;`
class LqrRouter {
  /// [navigatorKey]
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  /// [设置全局路由默认过度动画]
  static Route<dynamic> Function(LqrRouterClass) transition = LqrRouterTransition.cupertino;

  /// [角色]
  static List<String> roles = [];

  //++++++++++
  /// [返回]
  static pop([data = ""]) => navKey.currentState.pop(data);

  /// [返回到指定路由]
  static popUntil(String path) => navKey.currentState.popUntil(ModalRoute.withName(path));

  /// [销毁当前页面并跳转新页面]
  static removeRoute(LqrRouterClass route) => navKey.currentState.removeRoute(route.transition(route));

  /// [跳转新页面]
  static push(LqrRouterClass route) async {
    if (!await hook(route)) return;
    return navKey.currentState.push(route.transition(route));
  }
}

Future hook(LqrRouterClass route) async {
  bool permission = route.roles.any((item) => LqrRouter.roles.indexOf(item) != -1);
  if (route.roles != null && route.roles.isNotEmpty && !permission) {
    LqrUntils.print(
      "权限不足：${route.title}",
      ['用户角色：${LqrRouter.roles.join('/')}', '路由角色：${route.roles.join('/')}'],
    );
    if (route.notAllowFun != null)
      return route.notAllowFun();
    else
      return false;
  } else {
    return true;
  }
}
