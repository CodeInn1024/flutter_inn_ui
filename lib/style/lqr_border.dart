/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 11:47:03
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrBorder {
  static LqrBorder ui = new LqrBorder();

  /// ++++++++++++++++++++ [边框颜色] ++++++++++++++++++++
  ///
  /// [一级边框] Base Border Color
  final Color color1;

  /// [二级边框] light Border Color
  final Color color2;

  /// [三级边框] lighter Border Color
  final Color color3;

  /// [四级边框] extra Border Color
  final Color color4;

  /// ++++++++++++++++++++ [圆角] ++++++++++++++++++++
  ///
  /// [小圆角]
  final double radius1;

  /// [中圆角]
  final double radius2;

  /// [大圆角]
  final double radius3;

  /// [特大圆角]
  final double radius4;

  LqrBorder({
    this.color1 = const Color(0xFFDCDFE6),
    this.color2 = const Color(0xFFE4E7ED),
    this.color3 = const Color(0xFFEBEEF5),
    this.color4 = const Color(0xFFF2F6FC),
    double radius1,
    double radius2,
  })  : radius1 = radius1 ?? Lqr.ui.width(10),
        radius2 = radius2 ?? Lqr.ui.width(20),
        radius3 = radius1 ?? Lqr.ui.width(30),
        radius4 = radius1 ?? Lqr.ui.width(40);

  /// [全圆角]
  static BorderRadiusGeometry radius({double size}) => BorderRadius.circular(Lqr.ui.width(size ?? ui.radius2));

  /// [上圆角]
  static BorderRadiusGeometry radiusT({double size}) => BorderRadius.vertical(top: Radius.circular(Lqr.ui.width(size ?? ui.radius2)));

  /// [下圆角]
  static BorderRadiusGeometry radiusB({double size}) => BorderRadius.vertical(bottom: Radius.circular(Lqr.ui.width(size ?? ui.radius2)));

  /// [自定义边框]
  static Border border({double left = 0, double top = 0, double right = 0, double bottom = 0, Color color}) => Border(
        left: left == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(left), color: color ?? ui.color1),
        top: top == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(top), color: color ?? ui.color1),
        right: right == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(right), color: color ?? ui.color1),
        bottom: bottom == 0 ? BorderSide.none : BorderSide(width: Lqr.ui.width(bottom), color: color ?? ui.color1),
      );

  /// [全边框]
  static Border borderA(double width, {Color color}) => Border.all(width: Lqr.ui.width(width), color: color ?? ui.color1);
  // static BorderSide borderA(double width, {Color color}) => BorderSide(width: Lqr.ui.width(width), color: color ?? ui.color1);

  /// [间距]
  static interval({double height, Color color}) => Container(height: Lqr.ui.height(height ?? 13), color: color ?? Lqr.ui.backgroundColor);

  /// [线]
  static divider() => Divider(height: Lqr.ui.width(1), color: ui.color1, thickness: 0.9);
}
