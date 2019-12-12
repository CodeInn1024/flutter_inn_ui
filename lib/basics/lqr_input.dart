import 'package:flutter_lqrui/lqr_common.dart';

class LqrInput extends StatelessWidget {
  /// [输入框主题]
  final LqrInputTypeClass theme;
  final Function(String) onChanged;
  final Function() onTap;

  /// [提示信息]]
  final String hintText;
  final TextEditingController controller;
  final Color background;
  final Widget icon;
  final BoxBorder border;
  final double height;
  final double width;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;

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
  final int type;
  final String title;

  /// [文字居中方式]
  final TextAlign textAlign;

  const LqrInput({
    Key key,
    this.onChanged,
    this.hintText = '请输入',
    this.onTap,
    this.controller,
    this.background,
    this.icon,
    this.border,
    this.height = 80,
    this.width = 160,
    this.maxLines = 1,
    this.contentPadding,
    this.circle = false,
    this.round = 10,
    this.enabled = true,
    this.required = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputFormatters,
    this.type = 1,
    this.title,
    this.textAlign = TextAlign.start,
    this.theme = LqrInputType.dark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: LqrText.color2, fontSize: Lqr.ui.size(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title == null ? Container() : Text(title),
          Expanded(
            child: Container(
              height: maxLines == null ? Lqr.ui.width(height) : null,
              width: Lqr.ui.width(width),
              decoration: BoxDecoration(
                color: enabled ? theme.background : theme.disabledBackground,
                borderRadius: border != null ? null : BorderRadius.circular(Lqr.ui.width(circle ? height : round)),
                border: border,
              ),
              alignment: Alignment.centerLeft,
              child: input(),
            ),
          ),
        ],
      ),
    );
  }

  Widget input() {
    return TextFormField(
      onChanged: onChanged,
      textAlign: textAlign,
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      style: TextStyle(
        textBaseline: TextBaseline.alphabetic,
        color: theme.textColor,
        fontSize: Lqr.ui.size(30),
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        border: InputBorder.none,
        contentPadding: contentPadding ?? LqrEdge.edgeTB(),
        icon: required
            ? Row(
                children: <Widget>[Text('* ', style: TextStyle(color: Colors.red)), icon],
                mainAxisSize: MainAxisSize.min,
              )
            : icon,
      ),
    );
  }
}

class LqrInputType {
  /// [暗色主题]]
  static const LqrInputTypeClass dark = LqrInputTypeClass(
    textColor: Color(0xFF606266),
    background: Color(0xFFF5F7FA),
    disabledBackground: Color(0xFFF5F7FA),
  );

  /// [亮色主题]
  static const LqrInputTypeClass bright = LqrInputTypeClass(
    textColor: Color(0xFF606266),
    background: Colors.white,
    disabledBackground: Color(0xFFF5F7FA),
  );
}

class LqrInputTypeClass {
  /// [文字颜色]
  final Color textColor;

  /// [输入框背景色]
  final Color background;

  /// [不可用颜色]
  final Color disabledBackground;

  const LqrInputTypeClass({this.textColor, this.background, this.disabledBackground});
}
