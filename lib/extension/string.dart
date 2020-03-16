/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-18 09:50:10
 * @LastEditors: hwd
 * @LastEditTime: 2020-01-20 10:46:38
*/

import 'package:flutter_lqrui/lqr_common.dart';

extension ParseNumbers on String {
  int toInt() => int.parse(this);
  double toDouble() => double.parse(this);

  /// [转Decimal]
  Decimal toDecimal() => this.isEmpty ? Decimal.zero : Decimal.parse(this);

  /// [空值判断]
  String strEmpty(String value) => this == "" || this == null ? value : this;
}
