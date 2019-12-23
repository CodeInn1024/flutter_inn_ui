/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-20 17:08:24
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-23 16:31:53
*/

import 'package:flutter_lqrui/lqr_common.dart';

extension ParseDateByString on String {
  /// [时间格式化]
  String formatDate({String format}) => this == "" ? "" : DateUtil.formatDateMs(int.parse(this), format: format ?? Lqr.ui.format);
}
