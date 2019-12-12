/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 17:58:12
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrEdge {
  static LqrEdge ui = new LqrEdge();

  /// [边距大小]
  final double size;

  LqrEdge({
    this.size = 20,
  });

  /// [边距]
  static EdgeInsetsGeometry edge({double left, double top, double right, double bottom}) => EdgeInsets.fromLTRB(
        left == null ? 0.0 : Lqr.ui.width(left),
        top == null ? 0.0 : Lqr.ui.width(top),
        right == null ? 0.0 : Lqr.ui.width(right),
        bottom == null ? 0.0 : Lqr.ui.width(bottom),
      );

  /// [全边距]
  static EdgeInsetsGeometry edgeA({double size}) => EdgeInsets.all(Lqr.ui.width(size ?? ui.size));

  /// [高自定义边距]
  static EdgeInsetsGeometry edgeH({double size, double left, double top, double right, double bottom, double tb, double lr}) => EdgeInsets.fromLTRB(
        Lqr.ui.width(lr ?? size ?? left ?? 0.0),
        Lqr.ui.width(tb ?? size ?? top ?? 0.0),
        Lqr.ui.width(lr ?? size ?? right ?? 0.0),
        Lqr.ui.width(tb ?? size ?? bottom ?? 0.0),
      );

  /// [左右边距]
  static EdgeInsetsGeometry edgeLR({double size}) => EdgeInsets.fromLTRB(Lqr.ui.width(size ?? ui.size), 0.0, Lqr.ui.width(size ?? ui.size), 0.0);

  /// [上下边距]
  static EdgeInsetsGeometry edgeTB({double size}) => EdgeInsets.fromLTRB(0.0, Lqr.ui.width(size ?? ui.size), 0.0, Lqr.ui.width(size ?? ui.size));

  /// [左边距]
  static EdgeInsetsGeometry edgeL({double size}) => EdgeInsets.only(left: Lqr.ui.width(size ?? ui.size));

  /// [上边距]
  static EdgeInsetsGeometry edgeT({double size}) => EdgeInsets.only(top: Lqr.ui.width(size ?? ui.size));

  /// [右边距]
  static EdgeInsetsGeometry edgeR({double size}) => EdgeInsets.only(right: Lqr.ui.width(size ?? ui.size));

  /// [下边距]
  static EdgeInsetsGeometry edgeB({double size}) => EdgeInsets.only(bottom: Lqr.ui.width(size ?? ui.size));
}
