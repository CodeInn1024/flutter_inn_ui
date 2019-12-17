/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-17 18:04:28
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrSelectStyle extends StatefulWidget {
  final Widget content;
  final String leading;
  final Function() onTap;
  final String value;
  final String hintText;
  const LqrSelectStyle({
    Key key,
    this.content,
    this.leading,
    this.onTap,
    this.value = '',
    this.hintText = '',
  }) : super(key: key);
  @override
  _LqrSelectStyleState createState() => _LqrSelectStyleState();
}

class _LqrSelectStyleState extends State<LqrSelectStyle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        widget.leading == null
            ? Container()
            : Container(
                margin: LqrEdge.edgeR(),
                child: Text(widget.leading, style: TextStyle(color: LqrText.color3, fontSize: Lqr.ui.size(28))),
              ),
        Expanded(
          child: Container(
            height: Lqr.ui.width(60),
            padding: LqrEdge.edgeH(size: 10, left: 15, right: 15),
            decoration: BoxDecoration(borderRadius: LqrBorder.radius(), border: LqrBorder.borderA(1)),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: Lqr.ui.size(26), color: LqrText.color2),
                    child: widget.content ??
                        InkWell(
                          onTap: widget.onTap,
                          child: widget.value == '' ? Text(widget.hintText, style: TextStyle(color: LqrText.color4)) : Text(widget.value),
                        ),
                  ),
                ),
                LqrIcon(code: 0xe65a),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
