/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 17:01:19
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrSelectStyle extends StatefulWidget {
  final Widget content;

  /// [左边文字]
  final String leading;

  /// [点击事件]
  final Function() onTap;

  /// [显示文字]
  final String value;

  /// [提示文字]
  final String hintText;

  /// [清除时间]
  final Function() clean;

  const LqrSelectStyle({
    Key key,
    this.content,
    this.leading,
    this.onTap,
    this.value = '',
    this.hintText = '',
    this.clean,
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
                margin: LqrEdge.right(),
                child: Text(widget.leading, style: IText.style3(28)),
              ),
        Expanded(
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: Lqr.ui.width(60),
              padding: LqrEdge.custom(size: 10, left: 15, right: 15),
              decoration: BoxDecoration(borderRadius: IRadius.radius(), border: IBorder.all(2)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DefaultTextStyle(
                      style: IText.style2(26),
                      child: widget.content ?? widget.value == '' ? Text(widget.hintText, style: TextStyle(color: IText.color4)) : Text(widget.value),
                    ),
                  ),
                  widget.clean == null
                      ? Container()
                      : GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: widget.clean,
                          child: Container(padding: LqrEdge.lr(), child: IIcon(IIcons.close)),
                        ),
                  IIcon(IIcons.caretBottom),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
