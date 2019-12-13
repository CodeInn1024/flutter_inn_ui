/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-13 17:45:57
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrDateTime {
  static String formatDateMs(int val, {String format}) => DateUtil.formatDateMs(val, format: format ?? "yyyy-M-d HH:mm:ss");
  static String formatDateMsStr(String val, {String format}) => val == "" ? "" : DateUtil.formatDateMs(int.parse(val), format: format ?? "yyyy-M-d HH:mm:ss");
}
