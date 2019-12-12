/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-21 11:48:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 12:14:48
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrSearch extends StatelessWidget {
  final Function(String) onChanged;
  final Function() onTap;
  final String hintText;
  final bool circle;

  const LqrSearch({
    Key key,
    this.onTap,
    this.onChanged,
    this.hintText,
    this.circle = true, //是否圆形
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: LqrInput(
            height: 60,
            hintText: hintText,
            background: Colors.grey[200],
            circle: circle,
            contentPadding: LqrEdge.edgeLR(),
            onChanged: onChanged,
          ),
        ),
        onTap == null
            ? Container()
            : Row(
                children: <Widget>[
                  Container(width: Lqr.ui.width(20)),
                  LqrButton(title: "搜索", size: LqrButtonSize.mini, onTap: onTap, theme: LqrButtonTheme(type: LqrButtonType.primary)),
                ],
              )
      ],
    );
  }
}
