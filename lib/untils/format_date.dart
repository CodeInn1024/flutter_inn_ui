/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 11:33:34
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrDateTime {
  static formatDateMs(int val, {String format}) => DateUtil.formatDateMs(val, format: format ?? "yyyy-M-d HH:mm:ss");
}
