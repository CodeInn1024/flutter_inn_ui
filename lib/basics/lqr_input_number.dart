/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-09 10:05:40
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-16 18:42:20
*/


import 'package:flutter_lqrui/lqr_common.dart';

class LqrInputNumber extends StatefulWidget {
  /// [绑定值]
  final String value;

  /// [设置计数器允许的最小值]
  final String min;

  /// [设置计数器允许的最大值]
  final String max;

  /// [计步器步长]
  final String step;

  /// [是否只能输入 step 的倍数]
  final bool stepStrictly;

  /// [精确小数点]
  final int precision;

  /// [change事件]
  final Function(String value) onChange;

  /// [计数器尺寸]
  final LqrInputNumberSizeClass size;

  /// [是否可用]
  final bool enabled;

  LqrInputNumber({
    Key key,
    this.onChange,
    this.value = '0',
    this.min = '0',
    this.max = "999999999",
    this.step = '1',
    this.stepStrictly = false,
    this.precision = 0,
    this.size = LqrInputNumberSize.mini,
    this.enabled = true,
  }) : super(key: key);

  @override
  _LqrInputNumberState createState() => _LqrInputNumberState();
}

class _LqrInputNumberState extends State<LqrInputNumber> {
  TextEditingController _value = TextEditingController();
  String _v;
  bool _rightBtn = false;
  bool _leftBtn = true;

  @override
  void initState() {
    super.initState();
    _v = LqrUntils.decimal(widget.value) > LqrUntils.decimal(widget.max) ? widget.max : widget.value;
    _v = LqrUntils.decimal(widget.value) > LqrUntils.decimal(widget.min) ? widget.min : widget.value;
    _value.text = LqrUntils.decimal(_v).toStringAsFixed(widget.precision);
    _rightBtn = widget.enabled && LqrUntils.decimal(_v) < LqrUntils.decimal(widget.max);
    _leftBtn = widget.enabled && LqrUntils.decimal(_v) > LqrUntils.decimal(widget.min);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Lqr.ui.width(widget.size.btnSize),
      width: Lqr.ui.width(widget.size.btnSize * 2 + widget.size.inputSize),
      decoration: BoxDecoration(
        borderRadius: LqrBorder.radius(),
        border: Border.all(width: Lqr.ui.width(1), color: Color(0xFFdcdfe6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          btn('reduce'),
          Expanded(
            child: LqrInput(
              // background: Colors.black38,
              controller: _value,
              round: 0,
              // height: widget.size.btnSize,
              width: widget.size.inputSize,
              textAlign: TextAlign.center,
              theme: LqrInputType.bright,
              onChanged: widget.onChange,
              keyboardType: TextInputType.number,
              enabled: widget.enabled,
            ),
          ),
          btn('add'),
        ],
      ),
    );
  }

  void arithmetic(type) {
    if (type == 'add') {
      if (LqrUntils.decimal(_v) >= LqrUntils.decimal(widget.max) || !_rightBtn) return;
      _v = (LqrUntils.decimal(_v) + LqrUntils.decimal(widget.step)).toStringAsFixed(widget.precision);
    } else {
      if (LqrUntils.decimal(_v) <= LqrUntils.decimal(widget.min) || !_leftBtn) return;
      _v = (LqrUntils.decimal(_v) - LqrUntils.decimal(widget.step)).toStringAsFixed(widget.precision);
    }
    setState(() {
      _rightBtn = LqrUntils.decimal(_v) < LqrUntils.decimal(widget.max);
      _leftBtn = LqrUntils.decimal(_v) > LqrUntils.decimal(widget.min);
      _value.text = _v;
    });
    widget.onChange(_value.text);
  }

  Widget btn(type) => GestureDetector(
        onTap: () => arithmetic(type),
        child: Container(
            height: Lqr.ui.width(widget.size.btnSize),
            width: Lqr.ui.width(widget.size.btnSize),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FA),
              // border: Border(left: BorderSide(width: Lqr.ui.width(1), color: Color(0xFFdcdfe6))),
              border: LqrBorder.border(left: type == "add" ? 1 : 0, right: type == "reduce" ? 1 : 0, color: Color(0xFFdcdfe6)),
            ),
            child: Text(
              type == "add" ? '+' : '—',
              style: TextStyle(color: type == "add" && _rightBtn || type == "reduce" && _leftBtn ? null : Color(0xFFc0c4cc)),
            )),
      );
}

class LqrInputNumberSize {
  static const LqrInputNumberSizeClass mini = LqrInputNumberSizeClass(btnSize: 80, inputSize: 120);
}

class LqrInputNumberSizeClass {
  final double btnSize;
  final double inputSize;
  const LqrInputNumberSizeClass({this.btnSize, this.inputSize});
}
