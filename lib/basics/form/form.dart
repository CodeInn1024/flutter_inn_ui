/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-31 15:57:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-20 16:51:13
*/
import 'package:flutter_lqrui/lqr_common.dart';

class IForm extends StatefulWidget {
  /// [必须星号]
  final bool isMustIcon;

  /// [内边距]
  final EdgeInsetsGeometry padding;

  /// [背景颜色]
  final Color color;

  /// [左边宽度]
  final double width;

  /// [右边视图]
  final Widget rightWidget;

  /// [选择样式]
  final FormSelect formSelect;

  /// [输入框样式]
  final FormInput formInput;

  /// [标题居中方式]
  final AlignmentGeometry titleAlign;

  IForm({
    Key key,
    this.isMustIcon = false,
    EdgeInsetsGeometry padding,
    this.color,
    this.width = 150,
    this.rightWidget,
    this.formSelect,
    this.formInput,
    this.titleAlign = Alignment.centerLeft,
  })  : padding = padding ?? LqrEdge.lr(),
        super(key: key);

  @override
  _IFormState createState() => _IFormState();
}

class _IFormState extends State<IForm> {
  IconData _icon;
  String _title;
  Widget _content;

  @override
  void initState() {
    super.initState();
    _icon = widget.formSelect?.icon ?? widget.formInput?.icon;
    _title = widget.formSelect?.title ?? widget.formInput?.title;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.formSelect != null) {
      _content = _select;
    } else if (widget.formInput != null) {
      _content = _input;
    }
    return Container(
      height: Lqr.ui.width(80),
      padding: widget.padding,
      decoration: BoxDecoration(
        border: IBorder.bottom(2),
        color: widget.color,
      ),
      child: Row(
        children: <Widget>[
          widget.isMustIcon ? Text("* ", style: TextStyle(color: Colors.red)) : SizedBox(),
          _icon == null ? SizedBox() : IIcon(_icon, color: IText.color2, size: 24, padding: LqrEdge.right()),
          _title == null
              ? SizedBox()
              : Container(
                  width: Lqr.ui.width(widget.width),
                  alignment: widget.titleAlign,
                  padding: LqrEdge.right(20),
                  child: Text(_title, style: IText.style1(28)),
                ),
          _content,
          widget.rightWidget ?? SizedBox(),
        ],
      ),
    );
  }

  Widget get _select => Expanded(
        child: GestureDetector(
          onTap: widget.formSelect.enabled ? widget.formSelect.onTap : null,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.formSelect.valueName == "" ? widget.formSelect.hintText : widget.formSelect.valueName,
                  style: widget.formSelect.value == null ? IText.style3(26) : IText.style2(26),
                  textAlign: TextAlign.right,
                ),
              ),
              IIcon(IIcons.arrowRight, padding: LqrEdge.left(10), color: IText.color3),
            ],
          ),
        ),
      );

  Widget get _input => Expanded(
        child: IInput(
          controller: widget.formInput.controller,
          textAlign: widget.formInput.textAlign,
          hintText: widget.formInput.hintText,
          enabled: widget.formInput.enabled,
        ),
      );
}
