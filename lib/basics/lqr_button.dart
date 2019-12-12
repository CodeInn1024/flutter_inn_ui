/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-21 11:48:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 14:56:41
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrButtonTheme {
  static LqrButtonTheme ui = LqrButtonTheme();

  /// 按钮类型颜色
  LqrButtonTypeClass type;

  /// 圆角按钮 10
  double round;

  /// 是否圆形按钮
  bool circle;

  /// 正常状态下的阴影
  double elevation;

  /// 按下时的阴影
  double highlightElevation;

  /// 禁用时的阴影
  double disabledElevation;

  LqrButtonTheme({
    this.type = LqrButtonType.basics,
    this.round = 10,
    this.circle = false,
    this.elevation = 0.0,
    this.highlightElevation = 0.0,
    this.disabledElevation = 0.0,
  });
}

class LqrButton extends StatelessWidget {
  /// 点击事件
  final Function() onTap;

  /// 标题
  final String title;

  /// 边距
  final EdgeInsetsGeometry margin;

  /// 大小
  final LqrButtonSizeClass size;

  /// 是否朴素按钮
  final bool plain;

  /// 按钮主题
  final LqrButtonTheme theme;

  /// 是否可用
  final bool enabled;

  LqrButton({
    Key key,
    this.onTap,
    this.title,
    this.margin = EdgeInsets.zero,
    this.size = LqrButtonSize.big,
    this.plain = false,
    LqrButtonTheme theme,
    this.enabled = true,
  })  : theme = theme ?? LqrButtonTheme.ui,
        super(key: key);

  @override
  build(BuildContext context) {
    Gradient _gradient = theme.type.gradient;
    BorderRadiusGeometry _borderRadius = BorderRadius.circular(Lqr.ui.width(theme.circle ? size.height : theme.round));
    return Container(
      width: Lqr.ui.width(size.width),
      height: Lqr.ui.height(size.height),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: _gradient,
      ),
      child: RaisedButton(
        color: _gradient == null ? (plain ? Colors.white : theme.type.primaryColor) : Colors.transparent,
        padding: EdgeInsets.zero,
        elevation: theme.elevation,
        highlightElevation: theme.highlightElevation,
        disabledElevation: theme.disabledElevation,
        child: Text(title, style: TextStyle(fontSize: Lqr.ui.size(size.fontSize))),
        textColor: plain && _gradient == null ? theme.type.primaryColor : Colors.white,
        // disabledColor: Color(theme.type.primaryColor).withOpacity(0.8),
        // disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius,
          side: plain && _gradient == null ? BorderSide(width: 1, color: theme.type.borderColor) : BorderSide.none,
        ),
        onPressed: enabled ? onTap ?? () {} : null,
      ),
    );
  }
}

class LqrButtonType {
  /// [基础按钮]
  static const LqrButtonTypeClass basics = LqrButtonTypeClass(primaryColor: Color(0xFF606266), lightColor: Color(0xFFffffff), borderColor: Color(0xFFdcdfe6));

  /// [主要按钮]
  static const LqrButtonTypeClass primary = LqrButtonTypeClass(primaryColor: Color(0xFF409eff), lightColor: Color(0xFFecf5ff), borderColor: Color(0xFFb3d8ff));

  /// [成功按钮]
  static const LqrButtonTypeClass success = LqrButtonTypeClass(primaryColor: Color(0xFF67c23a), lightColor: Color(0xFFf0f9eb), borderColor: Color(0xFFc2e7b0));

  /// [信息按钮]
  static const LqrButtonTypeClass info = LqrButtonTypeClass(primaryColor: Color(0xFF909399), lightColor: Color(0xFFf4f4f5), borderColor: Color(0xFFd3d4d6));

  /// [警告按钮按钮]
  static const LqrButtonTypeClass warning = LqrButtonTypeClass(primaryColor: Color(0xFFe6a23c), lightColor: Color(0xFFfdf6ec), borderColor: Color(0xFFf5dab1));

  /// [危险按钮]
  static const LqrButtonTypeClass danger = LqrButtonTypeClass(primaryColor: Color(0xFFf56c6c), lightColor: Color(0xFFfef0f0), borderColor: Color(0xFFfbc4c4));

  /// [渐变按钮]
  static LqrButtonTypeClass redGradient = LqrButtonTypeClass(primaryColor: Color(0xFFf43f3b), lightColor: Color(0xFFfef0f0), borderColor: Color(0xFFf43f3b), gradient: LqrGradient.linear45(LqrColor.redG));
}

class LqrButtonTypeClass {
  /// [按钮颜色]
  final Color primaryColor;

  /// [高亮时颜色]
  final Color lightColor;

  /// [边框颜色]
  final Color borderColor;

  /// [渐变颜色]
  final Gradient gradient;

  const LqrButtonTypeClass({
    this.primaryColor = const Color(0xFF409eff),
    this.lightColor = const Color(0xFFecf5ff),
    this.borderColor = const Color(0xFFb3d8ff),
    this.gradient,
  });
}

class LqrButtonSize {
  /// [大号按钮]
  static const LqrButtonSizeClass big = LqrButtonSizeClass(width: 512, height: 76, fontSize: LqrText.sizeR28);

  /// [中等按钮] 176 * 88
  static const LqrButtonSizeClass medium = LqrButtonSizeClass(width: 196, height: 68, fontSize: LqrText.sizeR26);

  /// [小型按钮] 132 * 60
  static const LqrButtonSizeClass small = LqrButtonSizeClass(width: 132, height: 60, fontSize: LqrText.sizeR24);

  /// [迷你按钮] 100 * 44
  static const LqrButtonSizeClass mini = LqrButtonSizeClass(width: 100, height: 44, fontSize: LqrText.sizeR20);
}

class LqrButtonSizeClass {
  final double width;
  final double height;
  final double fontSize;
  const LqrButtonSizeClass({this.width, this.height, this.fontSize});
}
