/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-07 15:27:05
 * @LastEditors: hwd
 * @LastEditTime: 2020-02-05 10:10:27
*/

import 'package:flutter_lqrui/lqr_common.dart';

class IInput extends StatefulWidget {
  /// [控制器]
  final TextEditingController controller;

  /// [最大行数]
  final int maxLines;

  /// [最小行数]
  final int minLines;

  /// [是否隐藏文本]
  final bool obscureText;

  /// [输入改变的时候]
  final Function(String) onChanged;

  /// [最大长度]
  final int maxLength;

  /// [输入验证]
  final List<TextInputFormatter> inputFormatters;

  /// [字体大小]
  final double fontSize;

  /// [提示文字]
  final String hintText;

  /// [是否可以清除]
  final bool isClean;

  /// [是否可以隐藏内容]
  final bool isObscure;

  /// [清除回调]
  final Function() cleanTap;

  /// [居中方式]
  final TextAlign textAlign;

  /// [是否可用]
  final bool enabled;

  /// [字体颜色]
  final Color color;

  const IInput({
    Key key,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.onChanged,
    this.maxLength,
    this.inputFormatters,
    this.fontSize = 28,
    this.hintText,
    this.isClean = false,
    this.isObscure = false,
    this.cleanTap,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.color = IText.color2,
  }) : super(key: key);

  @override
  _IInputState createState() => _IInputState();
}

class _IInputState extends State<IInput> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: EdgeInsets.zero,
      textAlignVertical: TextAlignVertical.center,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      style: TextStyle(
        textBaseline: TextBaseline.alphabetic,
        color: widget.color,
        fontSize: Lqr.ui.size(widget.fontSize),
        fontWeight: FontWeight.w500,
      ),
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: widget.hintText,
        counterText: "",
        hintStyle: TextStyle(
          textBaseline: TextBaseline.alphabetic,
          color: IText.color3,
          fontSize: Lqr.ui.size(widget.fontSize),
          fontWeight: FontWeight.w500,
        ),
        // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1.0, style: BorderStyle.solid, color: Lqr.ui.primaryColor)),
        // enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1.0, style: BorderStyle.solid, color: LqrBorder.ui.color3)),
        border: InputBorder.none,
        suffix: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (widget.isObscure) ...[eye, SizedBox(width: 10)],
            if (widget.isClean) ...[clean, SizedBox(width: 10)],
          ],
        ),
      ),
    );
  }

  Widget get eye => GestureDetector(
        child: IIcon(_obscureText ? IIcons.closeEye : IIcons.openEye),
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );

  Widget get clean => GestureDetector(
        child: IIcon(IIcons.close),
        onTap: () {
          if (widget.cleanTap != null) widget.cleanTap();
          setState(() => widget.controller.text = "");
        },
      );
}
