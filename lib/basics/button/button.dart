/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-21 11:48:54
 * @LastEditors: hwd
 * @LastEditTime: 2020-01-16 17:40:06
*/

import 'package:flutter_lqrui/lqr_common.dart';

class IButton extends StatelessWidget {
  /// 点击事件
  final Function() onTap;

  /// 标题
  final String title;

  /// 边距
  final EdgeInsetsGeometry margin;

  /// 大小
  final IButtonSizeClass size;

  /// 是否朴素按钮
  final bool plain;

  /// 是否可用
  final bool enabled;

  /// 按钮类型颜色
  final IButtonTypeClass type;

  /// 圆角按钮 10
  final double round;

  /// 是否圆形按钮
  final bool circle;

  /// 正常状态下的阴影
  final double elevation;

  /// 按下时的阴影
  final double highlightElevation;

  /// 禁用时的阴影
  final double disabledElevation;

  IButton({
    Key key,
    this.onTap,
    this.title,
    this.margin = EdgeInsets.zero,
    this.size = IButtonSize.big,
    this.plain = false,
    this.enabled = true,
    IButtonTypeClass type,
    this.round = 10,
    this.circle = false,
    this.elevation = 0.0,
    this.highlightElevation = 0.0,
    this.disabledElevation = 0.0,
  })  : type = type ?? (plain ? IButtonType.basics : IButtonType.primary),
        super(key: key);

  @override
  build(BuildContext context) {
    Gradient _gradient = type.gradient;
    BorderRadiusGeometry _borderRadius = BorderRadius.circular(Lqr.ui.width(circle ? size.height : round));
    return Container(
      width: Lqr.ui.width(size.width),
      height: Lqr.ui.height(size.height),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: _gradient,
      ),
      child: RaisedButton(
        color: _gradient == null ? (plain ? Colors.white : type.primaryColor) : Colors.transparent,
        padding: EdgeInsets.zero,
        elevation: elevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        child: Text(title, style: TextStyle(fontSize: Lqr.ui.size(size.fontSize))),
        textColor: plain && _gradient == null ? type.primaryColor : Colors.white,
        // disabledColor: Color(type.primaryColor).withOpacity(0.8),
        // disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius,
          side: plain && _gradient == null ? BorderSide(width: 1, color: type.borderColor) : BorderSide.none,
        ),
        onPressed: enabled ? onTap ?? () {} : null,
      ),
    );
  }
}

class IButtonType {
  /// [禁用按钮]
  static const IButtonTypeClass disable = IButtonTypeClass(primaryColor: Color(0xFFcccccc), lightColor: Color(0xFFffffff), borderColor: Color(0xFFcccccc));

  /// [基础按钮]
  static const IButtonTypeClass basics = IButtonTypeClass(primaryColor: Color(0xFF606266), lightColor: Color(0xFFffffff), borderColor: Color(0xFFdcdfe6));

  /// [主要按钮]
  static const IButtonTypeClass primary = IButtonTypeClass(primaryColor: Color(0xFF409eff), lightColor: Color(0xFFecf5ff), borderColor: Color(0xFFb3d8ff));

  /// [成功按钮]
  static const IButtonTypeClass success = IButtonTypeClass(primaryColor: Color(0xFF67c23a), lightColor: Color(0xFFf0f9eb), borderColor: Color(0xFFc2e7b0));

  /// [信息按钮]
  static const IButtonTypeClass info = IButtonTypeClass(primaryColor: Color(0xFF909399), lightColor: Color(0xFFf4f4f5), borderColor: Color(0xFFd3d4d6));

  /// [警告按钮按钮]
  static const IButtonTypeClass warning = IButtonTypeClass(primaryColor: Color(0xFFe6a23c), lightColor: Color(0xFFfdf6ec), borderColor: Color(0xFFf5dab1));

  /// [危险按钮]
  static const IButtonTypeClass danger = IButtonTypeClass(primaryColor: Color(0xFFf56c6c), lightColor: Color(0xFFfef0f0), borderColor: Color(0xFFfbc4c4));

  /// [渐变按钮]
  static IButtonTypeClass redGradient = IButtonTypeClass(primaryColor: Color(0xFFf43f3b), lightColor: Color(0xFFfef0f0), borderColor: Color(0xFFf43f3b), gradient: LqrGradient.linear45(LqrColor.redG));
}

class IButtonTypeClass {
  /// [按钮颜色]
  final Color primaryColor;

  /// [高亮时颜色]
  final Color lightColor;

  /// [边框颜色]
  final Color borderColor;

  /// [渐变颜色]
  final Gradient gradient;

  const IButtonTypeClass({
    this.primaryColor = const Color(0xFF409eff),
    this.lightColor = const Color(0xFFecf5ff),
    this.borderColor = const Color(0xFFb3d8ff),
    this.gradient,
  });
}

class IButtonSize {
  /// [大号按钮]
  static const IButtonSizeClass big = IButtonSizeClass(width: 512, height: 76, fontSize: 28);

  /// [中等按钮] 176 * 88
  static const IButtonSizeClass medium = IButtonSizeClass(width: 196, height: 68, fontSize: 26);

  /// [小型按钮] 132 * 60
  static const IButtonSizeClass small = IButtonSizeClass(width: 132, height: 60, fontSize: 24);

  /// [迷你按钮] 100 * 44
  static const IButtonSizeClass mini = IButtonSizeClass(width: 100, height: 44, fontSize: 20);
}

class IButtonSizeClass {
  final double width;
  final double height;
  final double fontSize;
  const IButtonSizeClass({this.width, this.height, this.fontSize});
}
