/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-13 16:58:50
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrEdge {
  /// [边距]
  static EdgeInsetsGeometry edge([double left, double top, double right, double bottom]) => EdgeInsets.fromLTRB(
        left == null ? 0.0 : Lqr.ui.width(left),
        top == null ? 0.0 : Lqr.ui.width(top),
        right == null ? 0.0 : Lqr.ui.width(right),
        bottom == null ? 0.0 : Lqr.ui.width(bottom),
      );

  /// [全边距]
  static EdgeInsetsGeometry all([double size]) => EdgeInsets.all(Lqr.ui.width(size ?? Lqr.ui.edgeInsets));

  /// [高自定义边距]
  static EdgeInsetsGeometry custom({double size, double left, double top, double right, double bottom, double tb, double lr}) => EdgeInsets.fromLTRB(
        Lqr.ui.width(left ?? lr ?? size ?? 0.0),
        Lqr.ui.width(top ?? tb ?? size ?? 0.0),
        Lqr.ui.width(right ?? lr ?? size ?? 0.0),
        Lqr.ui.width(bottom ?? tb ?? size ?? 0.0),
      );

  /// [左右边距]
  static EdgeInsetsGeometry lr([double size]) => EdgeInsets.fromLTRB(Lqr.ui.width(size ?? Lqr.ui.edgeInsets), 0.0, Lqr.ui.width(size ?? Lqr.ui.edgeInsets), 0.0);

  /// [上下边距]
  static EdgeInsetsGeometry tb([double size]) => EdgeInsets.fromLTRB(0.0, Lqr.ui.width(size ?? Lqr.ui.edgeInsets), 0.0, Lqr.ui.width(size ?? Lqr.ui.edgeInsets));

  /// [左边距]
  static EdgeInsetsGeometry left([double size]) => EdgeInsets.only(left: Lqr.ui.width(size ?? Lqr.ui.edgeInsets));

  /// [上边距]
  static EdgeInsetsGeometry top([double size]) => EdgeInsets.only(top: Lqr.ui.width(size ?? Lqr.ui.edgeInsets));

  /// [右边距]
  static EdgeInsetsGeometry right([double size]) => EdgeInsets.only(right: Lqr.ui.width(size ?? Lqr.ui.edgeInsets));

  /// [下边距]
  static EdgeInsetsGeometry bottom([double size]) => EdgeInsets.only(bottom: Lqr.ui.width(size ?? Lqr.ui.edgeInsets));
}
