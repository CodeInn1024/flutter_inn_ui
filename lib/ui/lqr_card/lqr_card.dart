/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 12:48:58
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrCard extends StatelessWidget {
  final Function() onTap;
  final Widget hearder;
  final double hearderHeight;
  final Widget content;
  final EdgeInsetsGeometry margin;
  const LqrCard({
    Key key,
    this.onTap,
    this.hearder,
    this.hearderHeight = 68,
    this.content,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(borderRadius: LqrBorder.radius(), color: Colors.white, boxShadow: LqrShadow.boxShadow),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            hearder != null ? Container(height: Lqr.ui.width(hearderHeight), padding: LqrEdge.edgeLR(), child: hearder, alignment: Alignment.centerLeft) : Container(),
            hearder != null && content != null ? LqrBorder.divider() : Container(),
            content != null ? Container(padding: LqrEdge.edgeA(), child: content) : Container(),
          ],
        ),
      ),
    );
  }
}
