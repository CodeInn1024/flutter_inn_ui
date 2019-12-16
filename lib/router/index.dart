/*
 * @Description: 路由
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-16 10:17:00
*/

import 'package:flutter_lqrui/lqr_common.dart';

/// [MaterialApp] 添加 `navigatorKey: LqrRouter.navKey`
///
/// 设置全局默认过度动画 `LqrRouter.defaultType = LqrRouterType.material;`
class LqrRouter {
  /// [navigatorKey]
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  /// [默认过度动画]
  static LqrRouterType defaultType = LqrRouterType.cupertino;

  /// [角色]
  static List<String> roles = [];

  /// [组件路由跳转]
  static push(LqrRouterClass router) async {
    if (!await hook(router)) return;
    return navKey.currentState.push(animationType(router));
  }

  /// [返回]
  static pop([data = ""]) => navKey.currentState.pop(data);
}

Route<dynamic> animationType(LqrRouterClass router) {
  Route _r;
  switch (router.type) {
    case LqrRouterType.cupertino:
      _r = LqrRouterAnimation.cupertino(router.page);
      break;
    case LqrRouterType.material:
      _r = LqrRouterAnimation.material(router.page);
      break;
  }
  return _r;
}

Future hook(LqrRouterClass router) async {
  bool permission = router.roles.any((item) => LqrRouter.roles.indexOf(item) != -1);
  if (router.roles != null && router.roles.isNotEmpty && !permission) {
    debugPrint(LqrUntils.printStr(
      "权限不足：${router.title}",
      ['用户角色：${LqrRouter.roles.join('/')}', '路由角色：${router.roles.join('/')}'],
    ));
    if (router.notAllowFun != null)
      return router.notAllowFun();
    else
      return false;
  } else {
    return true;
  }
}
