import 'package:flutter_lqrui/lqr_common.dart';
export './index.dart' show LqrRouter;
export './animation.dart';

class LqrRouterClass {
  /// 路径，命令路由使用
  final String path;

  /// 标题
  final String title;

  /// 角色权限
  final List<String> roles;

  /// 页面，组件路由使用
  final Widget page;

  /// 路由过度动画，只支持组件路由
  final LqrRouterType type;

  /// 权限不足
  final bool Function() notAllowFun;

  LqrRouterClass(
    this.page, {
    this.path = '',
    this.roles = const [],
    this.title = '',
    LqrRouterType type,
    this.notAllowFun,
  }) : type = type ?? LqrRouter.defaultType;
}

enum LqrRouterType {
  /// [Android风格]
  material,

  /// [ios风格]
  cupertino,
}
