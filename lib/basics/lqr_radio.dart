/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 09:11:56
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-11 17:39:34
*/

import 'package:flutter_lqrui/lqr_common.dart';

String groupValueStr = LqrUntils.printStr("groupValue不能为空");

class LqrRadio extends StatefulWidget {
  /// 默认绑定的值
  final String value;

  /// 横向间距
  final double spacing;

  /// 竖向间距
  final double runSpacing;

  /// 样式
  final String type;

  /// 事件( data, active)
  final Function(LqrRadioClass data, bool active) onChanged;

  /// 构建(context, data, active)
  final Widget Function(BuildContext context, LqrRadioClass data, bool active) builder;

  /// List<LqrRadioClass> 数据
  final List<LqrRadioClass> groupValue;

  
  /// 圆角
  final double radio;

  LqrRadio({
    Key key,
    this.value,
    this.spacing = 20,
    this.runSpacing = 20,
    this.type = LqrRadioType.basics,
    this.onChanged,
    this.builder,
    this.radio = 20,
    @required this.groupValue,
  })  : assert(groupValue != null && groupValue.length > 0, groupValueStr),
        super(key: key);

  @override
  _LqrRadioState createState() => _LqrRadioState();
}

class _LqrRadioState extends State<LqrRadio> {
  String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.groupValue[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: LqrBorder.radius(size: widget.radio),
      child: Container(
        decoration: widget.type == LqrRadioType.button
            ? BoxDecoration(
                border: LqrBorder.borderA(1, color: Colors.black),
                borderRadius: LqrBorder.radius(),
              )
            : null,
        child: Wrap(
          spacing: Lqr.ui.width(widget.type == LqrRadioType.button ? 0.0 : widget.spacing),
          runSpacing: Lqr.ui.width(widget.runSpacing),
          children: widget.groupValue
              .map((v) => GestureDetector(
                    onTap: () {
                      setState(() => _value = v.value);
                      if (widget.onChanged != null) widget.onChanged(v, _value == v.value);
                    },
                    child: builder(context, v, _value == v.value),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget builder(context, data, active) {
    if (widget.builder != null)
      return widget.builder(context, data, active);
    else
      switch (widget.type) {
        case LqrRadioType.basics:
          return basics(context, data, active);
          break;
        case LqrRadioType.button:
          return button(context, data, active);
          break;
        default:
          return basics(context, data, active);
      }
  }

  Widget basics(context, data, active) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LqrIcon(icon: active ? LqrIconType.radioOn : LqrIconType.radioOff),
          Container(width: Lqr.ui.width(15)),
          Text(data.name),
        ],
      );

  Widget button(context, data, active) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: LqrEdge.edgeH(lr: 20, tb: 10),
            color: active ? Lqr.ui.primaryColor : Colors.white,
            child: Text(data.name, style: TextStyle(fontSize: LqrText.size26, color: active ? Colors.white : Colors.black)),
          ),
        ],
      );
}

/// [单选数据]
class LqrRadioClass {
  String name;
  String value;
  LqrRadioClass({this.name, this.value});
}

/// [单选样式]
class LqrRadioType {
  static const String basics = "basics";
  static const String button = "button";
}

/// [单选 选中样式]
class LqrRadioOn extends StatelessWidget {
  const LqrRadioOn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LqrIcon(icon: LqrIconType.radioOn, size: 28);
  }
}

/// [单选 未选中样式]
class LqrRadioOff extends StatelessWidget {
  const LqrRadioOff({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LqrIcon(icon: LqrIconType.radioOff, size: 28);
  }
}
