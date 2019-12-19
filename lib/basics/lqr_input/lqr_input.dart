import 'package:flutter_lqrui/lqr_common.dart';

class LqrInput extends StatelessWidget {
  /// [输入框主题]
  final LqrInputTypeClass theme;

  /// [改变事件]
  final Function(String) onChanged;

  /// [点击事件]
  final Function() onTap;

  /// [提示信息]]
  final String hintText;

  /// [controller]
  final TextEditingController controller;

  /// [左边图标]
  final Widget icon;

  /// [边框]
  final BoxBorder border;

  /// [宽]
  final double width;

  /// [是否圆形]
  final bool circle;

  /// [圆角大小]
  final double round;

  /// [是否启动]
  final bool enabled;

  /// [是否显示必填星号]
  final bool required;

  /// [输入类型]
  final TextInputType keyboardType;

  /// [长度]
  final int maxLength;

  /// [输入规则]
  final List<TextInputFormatter> inputFormatters;

  /// [标题]
  final String title;

  /// [文字居中方式]
  final TextAlign textAlign;

  /// [大小]
  final LqrInputSizeClass size;

  /// [行数]
  final int maxLines;

  /// [内边距]
  final EdgeInsetsGeometry padding;

  /// [输入框字体大小]
  final double fontSize;

  /// [输入框字体颜色]
  final double textColor;

  /// [使用•替换，用于输入密码的场景等]
  final bool obscureText;

  const LqrInput({
    Key key,
    this.onChanged,
    this.hintText = '请输入',
    this.onTap,
    this.controller,
    this.icon,
    this.border,
    this.width = 160,
    this.circle = false,
    this.round = 0,
    this.enabled = true,
    this.required = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputFormatters,
    this.title,
    this.textAlign = TextAlign.start,
    this.theme = LqrInputType.bright,
    this.size = LqrInputSize.small,
    this.maxLines = 1,
    this.padding = const EdgeInsets.only(left: 10),
    this.fontSize,
    this.textColor,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _background = enabled ? theme.background : theme.disabledBackground;
    double _round = circle ? size.height : round;
    double _fontSize = fontSize ?? size.fontSize;
    Color _textColor = textColor ?? theme.textColor;

    return DefaultTextStyle(
      style: TextStyle(color: LqrText.color2, fontSize: _fontSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title == null ? Container() : Text(title),
          Expanded(
            child: Container(
              height: maxLines > 1 ? null : size.height,
              width: width,
              padding: padding,
              decoration: BoxDecoration(
                color: _background,
                borderRadius: _round == 0 ? null : LqrBorder.radius(size: _round),
                border: border,
              ),
              child: TextField(
                onChanged: onChanged,
                textAlign: textAlign,
                controller: controller,
                enabled: enabled,
                maxLines: maxLines,
                maxLength: maxLength,
                obscureText: obscureText,
                inputFormatters: inputFormatters,
                style: TextStyle(
                  textBaseline: TextBaseline.alphabetic,
                  color: _textColor,
                  fontSize: _fontSize,
                ),
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  counterText: '',
                  contentPadding: maxLines > 1 ? EdgeInsets.zero : size.contentPadding,
                  icon: required
                      ? Row(
                          children: <Widget>[Text('* ', style: TextStyle(color: Colors.red)), icon],
                          mainAxisSize: MainAxisSize.min,
                        )
                      : icon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
