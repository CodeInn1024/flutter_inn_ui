/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-18 09:50:10
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-18 10:00:09
*/

import 'package:flutter_lqrui/lqr_common.dart';

extension ParseNumbers on String {
  int parseInt() => int.parse(this);
  double parseDouble() => double.parse(this);
  Decimal parseDecimal() => Decimal.parse(this);
  Decimal decimalZero() => Decimal.zero;
}
