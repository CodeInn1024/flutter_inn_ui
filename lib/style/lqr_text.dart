/*
 * @Description: 对字体进行统一规范，力求在各个操作系统下都有最佳展示效果。
 * @Version: 1.0
 * @Autor: lqrui
 * @Date: 2019-12-03 11:19:57
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-07 15:24:16
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrText {
// +++++++++++++++++++++字体大小+++++++++++++++++++++
  /// 说明文字 20 标签文字等关注度低的文字
  static const double sizeR20 = 20;

  /// 说明文字 20 标签文字等关注度低的文字
  static double size20 = Lqr.ui.size(sizeR20);

  /// 辅助文字 24 页面辅助信息，次要内容等
  static const double sizeR24 = 24;

  /// 辅助文字 24 页面辅助信息，次要内容等
  static double size24 = Lqr.ui.size(sizeR24);

  /// 正文（小） 26 小号页面信息，用于提示
  static const double sizeR26 = 26;

  /// 正文（小） 26 小号页面信息，用于提示
  static double size26 = Lqr.ui.size(sizeR26);

  /// 正文 28 页面默认字号，用于摘要或阅读文本
  static const double sizeR28 = 28;

  /// 正文 28 页面默认字号，用于摘要或阅读文本
  static double size28 = Lqr.ui.size(sizeR28);

  /// 小标题 32 页面小标题，首要层级显示内容
  static const double sizeR32 = 32;

  /// 小标题 32 页面小标题，首要层级显示内容
  static double size32 = Lqr.ui.size(sizeR32);

  /// 标题 36 页面大标题，用于结果页等单一信息页
  static const double sizeR36 = 36;

  /// 标题 36 页面大标题，用于结果页等单一信息页
  static double size36 = Lqr.ui.size(sizeR36);

  /// 主标题 40 用于图标、数字等较大显示
  static const double sizeR40 = 40;

  /// 主标题 40 用于图标、数字等较大显示
  static double size40 = Lqr.ui.size(sizeR40);

// +++++++++++++++++++++字体颜色+++++++++++++++++++++
  /// 主要文字 Primary
  static const Color color1 = Color(0xFF2b2f33);

  /// 常规文字 Regular
  static const Color color2 = Color(0xFF5b5e66);

  /// 次要文字 Secondary
  static const Color color3 = Color(0xFF818d99);

  /// 占位文字 Placeholder
  static const Color color4 = Color(0xFFcccccc);
}
