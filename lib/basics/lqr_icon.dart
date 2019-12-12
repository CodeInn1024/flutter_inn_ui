/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-10 15:10:07
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrIcon extends StatelessWidget {
  final int code;
  final IconData icon;
  final double size;
  final Color color;
  final String fontFamily;

  LqrIcon({
    Key key,
    this.code,
    this.icon,
    this.size = 25,
    Color color,
    this.fontFamily,
  })  : color = color ?? Lqr.ui.primaryColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon ?? IconData(code, fontFamily: fontFamily ?? Lqr.ui.iconFamily), size: Lqr.ui.size(size), color: color);
  }
}

class LqrIconType {
  /// [加载]
  static IconData loading = IconData(0xe60a, fontFamily: 'LqrIcon');

  /// [暂无数据]
  static IconData nodata = IconData(0xe6c1, fontFamily: 'LqrIcon');

  /// [用户]
  static IconData userSolid = IconData(0xe603, fontFamily: 'LqrIcon');

  /// [文件夹]
  static IconData folderSolid = IconData(0xe706, fontFamily: 'LqrIcon');

  /// [选择 on]  <i class="material-icons md-36">access_alarm</i> &#xe65b; material icon named "access alarm".
  static IconData radioOn = IconData(0xe61f, fontFamily: 'LqrIcon');

  /// [选择 off]
  static IconData radioOff = IconData(0xe660, fontFamily: 'LqrIcon');

  /// [箭头上]
  static IconData arrowUp = IconData(0xe658, fontFamily: 'LqrIcon');

  /// [箭头下]
  static IconData arrowDown = IconData(0xe65a, fontFamily: 'LqrIcon');
}
