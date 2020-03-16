/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 16:33:19
*/

import 'package:flutter_lqrui/lqr_common.dart';

class IRadius {
  /// [全圆角]
  static BorderRadiusGeometry radius([double size]) => BorderRadius.circular(Lqr().width(size ?? Lqr().radius));

  /// [上圆角]
  static BorderRadiusGeometry top({double size}) => BorderRadius.vertical(top: Radius.circular(Lqr().width(size ?? Lqr().radius)));

  /// [下圆角]
  static BorderRadiusGeometry bottom({double size}) => BorderRadius.vertical(bottom: Radius.circular(Lqr().width(size ?? Lqr().radius)));
}
