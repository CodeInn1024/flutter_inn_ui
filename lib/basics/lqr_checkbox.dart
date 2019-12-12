/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 09:11:56
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 09:54:34
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrCheckbox extends StatefulWidget {
  /// [默认绑定的值]
  final List<String> value;

  /// [横向间距]
  final double spacing;

  /// [竖向间距]
  final double runSpacing;

  /// [样式]
  final String type;

  /// [事件( data, active)]
  final Function(List<String>) onChanged;

  /// [构建(context, data, active)]
  final Widget Function(BuildContext context, LqrCheckboxClass data, bool active) builder;

  /// [List<LqrCheckboxClass> 数据]
  final List<LqrCheckboxClass> groupValue;

  LqrCheckbox({
    Key key,
    this.value,
    this.spacing = 20,
    this.runSpacing = 20,
    this.type = LqrCheckboxType.basics,
    this.onChanged,
    this.builder,
    @required this.groupValue,
  })  : assert(groupValue != null && groupValue.length > 0, groupValueStr),
        super(key: key);

  @override
  _LqrCheckboxState createState() => _LqrCheckboxState();
}

class _LqrCheckboxState extends State<LqrCheckbox> {
  Map<String, String> _value = {};

  @override
  void initState() {
    super.initState();
    if (widget.value != null && widget.value.length > 0) {
      widget.groupValue.forEach((v) {
        if (widget.value.contains(v.value)) _value[v.value] = v.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: LqrBorder.radius(),
      child: Container(
        decoration: widget.type == LqrCheckboxType.button
            ? BoxDecoration(
                border: LqrBorder.borderA(1, color: Colors.black),
                borderRadius: LqrBorder.radius(),
              )
            : null,
        child: Wrap(
          spacing: Lqr.ui.width(widget.type == LqrCheckboxType.button ? 0.0 : widget.spacing),
          runSpacing: Lqr.ui.width(widget.runSpacing),
          children: widget.groupValue
              .map((v) => GestureDetector(
                    onTap: () {
                      if (_value.containsKey(v.value))
                        setState(() => _value.remove(v.value));
                      else
                        setState(() => _value[v.value] = v.name);
                      if (widget.onChanged != null) widget.onChanged(_value.values.toList());
                    },
                    child: builder(context, v, _value.containsKey(v.value)),
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
        case LqrCheckboxType.basics:
          return basics(context, data, active);
          break;
        case LqrCheckboxType.button:
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
class LqrCheckboxClass {
  String name;
  String value;
  LqrCheckboxClass({this.name, this.value});
}

/// [单选样式]
class LqrCheckboxType {
  static const String basics = "basics";
  static const String button = "button";
}

/// [单选 选中样式]
class LqrCheckboxOn extends StatelessWidget {
  const LqrCheckboxOn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LqrIcon(icon: LqrIconType.radioOn, size: 28);
  }
}

/// [单选 未选中样式]
class LqrCheckboxOff extends StatelessWidget {
  const LqrCheckboxOff({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LqrIcon(icon: LqrIconType.radioOff, size: 28);
  }
}
