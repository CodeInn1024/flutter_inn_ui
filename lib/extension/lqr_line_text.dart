/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-27 17:00:09
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrLineText extends StatelessWidget {
  /// [多条]
  final List<LqrLineTextData> lists;

  /// [单条]
  final LqrLineTextData data;

  /// [左边样式]
  final TextStyle lstyle;

  /// [右边样式]
  final TextStyle rstyle;

  /// [外边距]
  final EdgeInsetsGeometry margin;

  /// [一行多少个]
  final int crossAxisCount;

  /// [竖向间距]
  final double mainAxisSpacing;

  /// [横向间距]
  final double crossAxisSpacing;

  /// [连接符]
  final String connector;

  const LqrLineText({
    Key key,
    this.lists = const [],
    this.data,
    this.lstyle,
    this.rstyle,
    this.margin = EdgeInsets.zero,
    this.crossAxisCount = 1,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.connector = "  ",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LqrLineTextData> _a = [...lists];
    if (data != null) _a.add(data);
    List<List<LqrLineTextData>> _lists = _a.groupToCount(crossAxisCount);

    List<Widget> _b = [];
    for (var i = 0; i < _lists.length; i++) {
      _b.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _lists[i].map((f) => Expanded(flex: f.flex, child: page(f))).toList(),
      ));
      if (i < _lists.length) _b.add(Container(height: Lqr.ui.width(mainAxisSpacing)));
    }

    return Container(margin: margin, child: Column(children: _b));
  }

  Widget page(LqrLineTextData v) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(v.title, style: lstyle ?? TextStyle(color: LqrText.color2, fontSize: Lqr.ui.size(28))),
        Text(connector),
        Expanded(
          child: DefaultTextStyle(
            style: rstyle ?? TextStyle(color: LqrText.color3, fontSize: Lqr.ui.size(28)),
            child: Container(
              alignment: Alignment.centerLeft,
              child: v.widget ?? Text(v.value ?? '', maxLines: v.maxLines, style: TextStyle(color: v.valueColor), overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ],
    );
  }
}

class LqrLineTextData {
  /// [标题]
  final String title;

  /// [内容字体颜色]
  final Color valueColor;

  /// [内容]
  final String value;

  /// [widget]
  final Widget widget;

  /// [占据比例]
  final int flex;

  /// [最大行数]
  final int maxLines;

  LqrLineTextData({
    this.title,
    this.value,
    this.widget,
    this.flex = 1,
    this.valueColor,
    this.maxLines = 1,
  });
}
