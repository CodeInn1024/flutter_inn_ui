/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-21 11:48:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:08:09
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrNoData extends StatelessWidget {
  /// [顶部距离]
  final double top;
  final double height;
  final String btnText;
  final Function() onclick;
  final String showText;
  final Color bgColor;
  const LqrNoData({
    Key key,
    this.top = 300,
    this.bgColor,
    this.height,
    this.btnText = "点击了解更多",
    this.onclick,
    this.showText = '暂无数据',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(height: Lqr.ui.width(top)),
        Image.asset('assets/images/no_data.png', width: Lqr.ui.width(230), fit: BoxFit.fitWidth),
        Container(height: Lqr.ui.width(20)),
        Text(showText, style: IText.style2(28)),
        onclick == null ? Container() : IButton(title: btnText ?? '', margin: LqrEdge.top(30), onTap: onclick),
      ],
    );
  }
}
