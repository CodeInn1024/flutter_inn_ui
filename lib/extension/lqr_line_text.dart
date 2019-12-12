/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 15:20:46
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

  const LqrLineText({
    Key key,
    this.lists,
    this.data,
    this.lstyle,
    this.rstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data != null
        ? page(data)
        : Row(
            children: lists.map((v) => Expanded(flex: v.flex, child: page(v))).toList(),
          );
  }

  Widget page(v) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(v.title, style: lstyle ?? TextStyle(color: LqrText.color2, fontSize: Lqr.ui.size(28))),
        Text('  '),
        Expanded(
          child: DefaultTextStyle(
            style: rstyle ?? TextStyle(color: LqrText.color3, fontSize: Lqr.ui.size(28)),
            child: Container(
              alignment: Alignment.centerLeft,
              child: v.widget ?? Text(v.value ?? '', maxLines: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class LqrLineTextData {
  final String title;
  final String value;
  final Widget widget;
  final int flex;
  LqrLineTextData({this.title, this.value, this.widget, this.flex = 1});
}
