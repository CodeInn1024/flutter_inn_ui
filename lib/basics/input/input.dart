/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-07 15:27:05
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-07 18:24:24
*/

import 'package:flutter_lqrui/lqr_common.dart';
import 'package:flutter/gestures.dart';

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

  /// [必填星号]
  final bool mustIcon;

  /// [标题]
  final String title;

  /// [字体大小]
  final double fontSize;

  const IInput({
    Key key,
    this.controller,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
    this.onChanged,
    this.maxLength,
    this.inputFormatters,
    this.mustIcon = false,
    this.title,
    this.fontSize = 16.0,
  }) : super(key: key);

  @override
  _IInputState createState() => _IInputState();
}

class _IInputState extends State<IInput> {
  List<TextInputFormatter> formatters;
  int _valueLength;

  @override
  void initState() {
    super.initState();
    formatters = widget.inputFormatters ?? <TextInputFormatter>[];
    if (widget.maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(widget.maxLength));
      _valueLength = widget.controller.text.runes.length;
      widget.controller.addListener(() {
        setState(() {
          _valueLength = widget.controller.text.runes.length;
          print(_valueLength);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: widget.fontSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.mustIcon ? Text("*", style: TextStyle(color: Lqr.ui.dangerColor)) : Container(),
                  widget.title == null ? Container() : Container(width: widget.fontSize * 6, margin: EdgeInsets.only(right: 10), child: Text(widget.title, style: TextStyle(color: LqrText.color1))),
                  Expanded(
                    child: EditableText(
                      controller: widget.controller, // 控制器
                      focusNode: FocusNode(debugLabel: "TextAffinity"),
                      cursorColor: Lqr.ui.primaryColor, // 光标颜色
                      style: TextStyle(color: LqrText.color2, fontSize: widget.fontSize), // 字体颜色
                      backgroundCursorColor: Lqr.ui.primaryColor, // 渲染浮动光标时，绘制与文本对齐的背景光标时使用的颜色
                      autocorrect: true, // 自动更正
                      cursorOffset: Offset(0.0, 0.0), // 偏移量
                      cursorOpacityAnimates: false, // 当光标闪烁时，光标是否从完全透明变为完全不透明
                      cursorRadius: null, // 光标圆角
                      cursorWidth: 2.0, // 光标厚度
                      dragStartBehavior: DragStartBehavior.start, // 确定处理拖动开始行为的方式
                      enableInteractiveSelection: true, // 长按将选择文本并显示剪切/复制/粘贴菜单，而点击将移动文本插入符号
                      enableSuggestions: true, // 是否在用户键入时显示输入建议
                      expands: true, // 填充其父级，maxLines必须为null
                      forceLine: true, // 是否采用全宽度
                      textWidthBasis: TextWidthBasis.longestLine,
                      inputFormatters: formatters,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      obscureText: widget.obscureText,
                      onChanged: widget.onChanged,
                      showSelectionHandles: true,
                      toolbarOptions: ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
                    ),
                  ),
                ],
              ),
            )),
        widget.maxLength == null ? Container() : Text("$_valueLength/${widget.maxLength}", style: TextStyle(color: LqrText.color4, fontSize: 12.0)),
      ],
    );
  }
}
