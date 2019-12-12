/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 10:49:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 10:40:27
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrGradient {
  /// *++++++++++++++++++++[渐变方式]++++++++++++++++++++*
  /// 
  /// 斜角45度渐变
  static Gradient linear45(List<Color> color) =>  LinearGradient(colors: color, begin: Alignment.bottomLeft, end: Alignment.topRight);
}
