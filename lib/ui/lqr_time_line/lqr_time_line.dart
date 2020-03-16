/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 17:01:32
*/

import 'package:flutter_lqrui/flutter_lqrui.dart';
import 'package:flutter_lqrui/lqr_common.dart';

class LqrTimeLine extends StatelessWidget {
  final Widget title;
  final Widget content;
  const LqrTimeLine({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[page()]),
    );
  }

  Widget page() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
              child: Container(
                width: Lqr.ui.width(15),
                height: Lqr.ui.width(15),
                alignment: Alignment.center,
                color: Lqr.ui.primaryColor,
                child: Text("", style: TextStyle(fontSize: Lqr.ui.size(12), color: Colors.white)),
              ),
            ),
            Expanded(child: Container(margin: LqrEdge.left(10), child: title)),
          ],
        ),
        Container(
          width: LqrUntils.screenWidth,
          padding: LqrEdge.custom(size: 20, left: 30),
          margin: LqrEdge.lr(7),
          decoration: BoxDecoration(
            border: IBorder.left(2),
          ),
          child: Container(child: content),
        ),
      ],
    );
  }
}
