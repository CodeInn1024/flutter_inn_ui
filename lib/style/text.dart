/*
 * @Description: 对字体进行统一规范，力求在各个操作系统下都有最佳展示效果。
 * @Version: 1.0
 * @Autor: lqrui
 * @Date: 2019-12-03 11:19:57
 * @LastEditors: hwd
 * @LastEditTime: 2020-01-20 10:20:08
*/

import 'package:flutter_lqrui/lqr_common.dart';

class IText {
// +++++++++++++++++++++字体颜色+++++++++++++++++++++
  /// 主要文字 Primary
  static const Color color1 = Color(0xFF2b2f33);

  /// 常规文字 Regular
  static const Color color2 = Color(0xFF5b5e66);

  /// 次要文字 Secondary
  static const Color color3 = Color(0xFF818d99);

  /// 占位文字 Placeholder
  static const Color color4 = Color(0xFFcccccc);

  // +++++++++++++++++++++快捷样式+++++++++++++++++++++
  /// [主题颜色]
  static TextStyle style0(double size) => TextStyle(fontSize: Lqr.ui.size(size), color: Lqr.ui.primaryColor);
  static TextStyle style1(double size) => TextStyle(fontSize: Lqr.ui.size(size), color: IText.color1);
  static TextStyle style2(double size) => TextStyle(fontSize: Lqr.ui.size(size), color: IText.color2);
  static TextStyle style3(double size) => TextStyle(fontSize: Lqr.ui.size(size), color: IText.color3);
  static TextStyle style4(double size) => TextStyle(fontSize: Lqr.ui.size(size), color: IText.color4);

  /// [白色]
  static TextStyle style10(double size) => TextStyle(fontSize: Lqr.ui.size(size), color: Colors.white);

  /// [自定义颜色 字符窜]
  static TextStyle style20(double size, String color) => TextStyle(fontSize: Lqr.ui.size(size), color: LqrUntils.argbTo16(color));

  /// [自定义颜色 Color]
  static TextStyle style21(double size, [Color color]) => TextStyle(fontSize: Lqr.ui.size(size), color: color);
}
