/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-24 09:36:45
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:47:55
*/
import 'package:flutter_lqrui/lqr_common.dart';
export './index.dart' show LqrRouter;
export './animation.dart';

class LqrRouterClass {
  /// [路径，命令路由使用]
  final String path;

  /// [标题]
  final String title;

  /// [角色权限]
  final List<String> roles;

  /// [页面，组件路由使用]
  final Widget widget;

  /// [路由过度动画，只支持组件路由]
  final Route<dynamic> Function(LqrRouterClass) transition;

  /// [权限不足]
  final bool Function() notAllowFun;

  /// [图标]
  final int icon;

  /// [颜色]
  final int color;

  LqrRouterClass({
    @required this.widget,
    @required this.path,
    this.roles = const [],
    this.title = '',
    transition,
    this.notAllowFun,
    this.icon,
    this.color,
  }) : transition = transition ?? LqrRouter.transition;
}
