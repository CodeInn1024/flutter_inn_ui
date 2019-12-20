/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-18 09:50:10
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-20 16:58:06
*/

import 'package:flutter_lqrui/lqr_common.dart';

extension ParseNumbers on String {
  int parseInt() => int.parse(this);
  double parseDouble() => double.parse(this);

  /// [转Decimal]
  Decimal parseDecimal() => this.isEmpty ? Decimal.zero : Decimal.parse(this);
}
