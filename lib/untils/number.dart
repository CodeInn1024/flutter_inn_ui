/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-18 10:10:21
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-24 09:39:58
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrNum {
  /// [加]
  static String addStr(List<String> lists) => lists.reduce((a, b) => (a.toDecimal() + b.toDecimal()).toString());

  /// [加]
  static Decimal add(List<String> lists) => lists.reduce((a, b) => addStr([a, b])).toDecimal();

  /// [减]
  static String subtractStr(List<String> lists) => lists.reduce((a, b) => (a.toDecimal() - b.toDecimal()).toString());

  /// [减]
  static Decimal subtract(List<String> lists) => lists.reduce((a, b) => subtractStr([a, b])).toDecimal();

  /// [乘]
  static String multiplyStr(List<String> lists) => lists.reduce((a, b) => (a.toDecimal() * b.toDecimal()).toString());

  /// [乘]
  static Decimal multiply(List<String> lists) => lists.reduce((a, b) => multiplyStr([a, b])).toDecimal();
}
