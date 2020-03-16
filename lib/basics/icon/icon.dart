/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 17:16:12
*/

import 'package:flutter_lqrui/lqr_common.dart';

class IIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final EdgeInsetsGeometry padding;

  IIcon(
    this.icon, {
    Key key,
    this.size = 30,
    this.color,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Icon(icon, size: Lqr().size(size), color: color),
    );
  }
}
