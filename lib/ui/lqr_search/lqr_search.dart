/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-11-21 11:48:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-16 18:41:02
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
            hintText: hintText,
            circle: circle,
            size: LqrInputSize.mini,
            onChanged: onChanged,
            theme: LqrInputType.dark,
          ),
        ),
        onTap == null
            ? Container()
            : Row(
                children: <Widget>[
                  Container(width: Lqr.ui.width(20)),
                  IButton(title: "搜索", size: IButtonSize.mini, onTap: onTap),
                ],
              )
      ],
    );
  }
}
