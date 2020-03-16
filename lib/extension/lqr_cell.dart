/*
 * @Description: 单元格
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 09:11:56
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 17:00:08
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrCell extends StatefulWidget {
  /// 左侧 widget
  final Widget left;

  /// 右侧 widget
  final Widget right;

  /// 标题
  final String title;

  /// [点击事件]
  final Function() onTap;

  /// [外边距]
  final EdgeInsetsGeometry margin;

  /// [背景颜色]
  final Color background;

  /// [标题颜色]
  final Color titleColor;

  /// [圆角]
  final BorderRadiusGeometry borderRadius;

  /// [内边距]
  final EdgeInsetsGeometry padding;

  const LqrCell({
    Key key,
    this.left,
    this.right,
    this.title = "",
    this.onTap,
    this.margin,
    this.background = Colors.white,
    this.titleColor = IText.color2,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  _LqrCellState createState() => _LqrCellState();
}

class _LqrCellState extends State<LqrCell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: widget.padding ?? LqrEdge.all(),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: widget.borderRadius,
        ),
        child: Row(
          children: <Widget>[
            widget.left ?? Container(),
            Expanded(child: Text(widget.title, style: TextStyle(color: widget.titleColor))),
            widget.right ?? Container(),
          ],
        ),
      ),
    );
  }
}

class LqrCellWidget {
  static Widget origin = Container(
    width: Lqr.ui.width(10),
    height: Lqr.ui.width(10),
    margin: LqrEdge.right(15),
    decoration: BoxDecoration(color: Lqr.ui.primaryColor, borderRadius: IRadius.radius(10)),
  );
}
