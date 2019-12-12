/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 08:22:09
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 12:40:27
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrShadow {
  static const List<BoxShadow> boxShadow = [
    BoxShadow(color: Color(0x38AAAAAA), offset: Offset(2.0, 2.0), blurRadius: 3.0),
    BoxShadow(color: Color(0x38AAAAAA), offset: Offset(-1.0, -1.0), blurRadius: 5.0),
  ];

  /// red
  static const BoxShadow red = BoxShadow(color: Color(0x33cc453b), offset: Offset(6.0, 6.0), blurRadius: 8.0);

  /// orange
  static const BoxShadow orange = BoxShadow(color: Color(0xFFf37b1d), offset: Offset(2.0, 2.0), blurRadius: 3.0);

  /// 根据背景颜色投影
  // get bg()=>
}
