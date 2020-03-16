/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-17 09:47:06
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:03:58
*/
import 'package:flutter_lqrui/lqr_common.dart';
export './lqr_input.dart';

class LqrInputType {
  /// [暗色主题]]
  static const LqrInputTypeClass dark = LqrInputTypeClass(
    textColor: IText.color2,
    background: Color(0xFFefefef),
    disabledBackground: Color(0xFFffffff),
    disabledColor: IText.color3,
  );

  /// [亮色主题]
  static const LqrInputTypeClass bright = LqrInputTypeClass(
    textColor:IText.color2,
    background: Colors.white,
    disabledBackground: Color(0xFFF5F7FA),
    disabledColor: IText.color4,
  );

  /// [选择主题]
  static const LqrInputTypeClass select = LqrInputTypeClass(
    textColor: IText.color2,
    background: Colors.white,
    disabledBackground: Colors.white,
    disabledColor: IText.color4,
  );
}

class LqrInputTypeClass {
  /// [文字颜色]
  final Color textColor;

  /// [输入框背景色]
  final Color background;

  /// [不可用背景颜色]
  final Color disabledBackground;

  /// [不可用字体颜色]
  final Color disabledColor;

  const LqrInputTypeClass({
    this.textColor,
    this.background,
    this.disabledBackground,
    this.disabledColor,
  });
}

class LqrInputSize {
  static const LqrInputSizeClass mini = LqrInputSizeClass(
    height: 30,
    contentPadding: EdgeInsets.only(bottom: 12),
    fontSize: 14,
  );
  static const LqrInputSizeClass small = LqrInputSizeClass(
    height: 40,
    contentPadding: EdgeInsets.only(bottom: 9),
    fontSize: 15,
  );
}

class LqrInputSizeClass {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final double fontSize;
  const LqrInputSizeClass({this.height, this.contentPadding, this.fontSize});
}
