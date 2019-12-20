/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-20 17:59:16
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrDateTime {
  static String formatDateMs(int val, {String format}) => DateUtil.formatDateMs(val, format: format ?? "yyyy-M-d HH:mm:ss");
  static String formatDateMsStr(String val, {String format}) => val == "" ? "" : DateUtil.formatDateMs(int.parse(val), format: format ?? "yyyy-M-d HH:mm:ss");

  /// [根据年份月份获取当前月有多少天]
  static int monthForDay(int y, int m) {
    if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
      return 31;
    } else if (m == 2) {
      if (((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) {
        return 29;
      } else {
        return 28;
      }
    } else {
      return 30;
    }
  }
}
