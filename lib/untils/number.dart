/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-18 10:10:21
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-18 10:16:55
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrNum {
  /// [加](精确相加,防止精度丢失)
  static String addStr(String a, String b) => (a.parseDecimal() + a.parseDecimal()).toString();
  static Decimal add(String a, String b) => a.parseDecimal() + a.parseDecimal();

  /// [减](精确相减,防止精度丢失)
  static String subtractStr(String a, String b) => (a.parseDecimal() - a.parseDecimal()).toString();
  static Decimal subtract(String a, String b) => a.parseDecimal() - a.parseDecimal();
}
