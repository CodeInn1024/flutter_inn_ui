/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-09 10:05:40
 * @LastEditors: hwd
 * @LastEditTime: 2020-02-05 11:12:59
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

  ///[外边距]
  final EdgeInsetsGeometry margin;

  // /// [控制器]
  // final TextEditingController controller;

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
    this.margin = EdgeInsets.zero,
    // this.controller,
  }) : super(key: key);

  @override
  _LqrInputNumberState createState() => _LqrInputNumberState();
}

class _LqrInputNumberState extends State<LqrInputNumber> {
  TextEditingController _controller = TextEditingController();
  String _v;
  bool _rightBtn = false;
  bool _leftBtn = true;

  @override
  void initState() {
    super.initState();
    _v = LqrUntils.decimal(widget.value) > LqrUntils.decimal(widget.max) ? widget.max : widget.value;
    _v = LqrUntils.decimal(widget.value) > LqrUntils.decimal(widget.min) ? widget.min : widget.value;
    _controller.text = LqrUntils.decimal(_v).toStringAsFixed(widget.precision);
    _controller.selection = TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: _controller.text.length));
    _rightBtn = widget.enabled && LqrUntils.decimal(_v) < LqrUntils.decimal(widget.max);
    _leftBtn = widget.enabled && LqrUntils.decimal(_v) > LqrUntils.decimal(widget.min);
  }

  @override
  void dispose() { 
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Lqr.ui.width(widget.size.btnSize),
      width: Lqr.ui.width(widget.size.btnSize * 2 + widget.size.inputSize),
      decoration: BoxDecoration(
        borderRadius: IRadius.radius(),
        border: Border.all(width: Lqr.ui.width(1), color: Color(0xFFdcdfe6)),
      ),
      margin: widget.margin,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          btn('reduce'),
          Expanded(
            child: IInput(
              controller: _controller,
              textAlign: TextAlign.center,
              onChanged: (v) => changeVal(v),
            ),

            //   LqrInput(
            //     // background: Colors.black38,
            //     controller: _controller,
            //     round: 0,
            //     // height: widget.size.btnSize,
            //     width: widget.size.inputSize,
            //     textAlign: TextAlign.center,
            //     theme: LqrInputType.bright,
            //     onChanged: (v) {
            //       setState(() {
            //         if (int.parse(v) > int.parse(widget.max)) {
            //           _controller.text = widget.max;
            //           _v = widget.max;
            //         }else if (int.parse(v) < int.parse(widget.min)) {
            //           _controller.text = '0';
            //           _v = '0';
            //         }else{
            //           _controller.text = v;
            //           _v = v;
            //         }
            //         _rightBtn = LqrUntils.decimal(_v) < LqrUntils.decimal(widget.max);
            //         _leftBtn = LqrUntils.decimal(_v) > LqrUntils.decimal(widget.min);
            //       });
            //       print(v);
            //     },
            //     keyboardType: TextInputType.number,
            //     enabled: widget.enabled,
            //   ),
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
    changeVal(_v);
    widget.onChange(_controller.text);
  }

  void changeVal(v) {
    setState(() {
      if (int.parse(v) > int.parse(widget.max)) {
        _controller.text = widget.max;
        _v = widget.max;
        v = widget.max;
      } else if (int.parse(v) < int.parse(widget.min) || int.parse(v) == 0) {
        _controller.text = '0';
        _v = '0';
        v = '0';
      } else {
        _controller.text = int.parse(v).toString();
        _v = int.parse(v).toString();
      }
      _rightBtn = LqrUntils.decimal(_v) < LqrUntils.decimal(widget.max);
      _leftBtn = LqrUntils.decimal(_v) > LqrUntils.decimal(widget.min);
      _controller.selection = TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: _controller.text.length));
    });
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
              border: IBorder.border(left: type == "add" ? 1 : 0, right: type == "reduce" ? 1 : 0, color: Color(0xFFdcdfe6)),
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
