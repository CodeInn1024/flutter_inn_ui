/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-20 16:58:16
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-20 17:48:26
*/

import 'package:flutter_lqrui/lqr_common.dart';

int minDay = 1;
int maxDay = 30;

extension ParseDateByInt on int {
  /// [时间的开始, (y, m, d)]
  int dateStartByMs({bool isUtc = false, String type = "d"}) {
    DateTime d = DateTime.fromMillisecondsSinceEpoch(this, isUtc: isUtc);
    DateTime ms;
    switch (type) {
      case "y":
        ms = DateTime(d.year, 1, 1, 0, 0, 0);
        break;
      case "m":
        ms = DateTime(d.year, d.month, 1, 0, 0, 0);
        break;
      case "d":
        ms = DateTime(d.year, d.month, d.day, 0, 0, 0);
        break;
      default:
    }
    return ms.millisecondsSinceEpoch;
  }

  /// [时间的结束, (y, m, d)]
  int dateEndByMs({bool isUtc = false, String type = "d"}) {
    DateTime d = DateTime.fromMillisecondsSinceEpoch(this, isUtc: isUtc);
    DateTime ms;
    switch (type) {
      case "y":
        ms = DateTime(d.year, 12, 31, 23, 59, 59);
        break;
      case "m":
        ms = DateTime(d.year, d.month, LqrDateTime.monthForDay(d.year, d.month), 23, 59, 59);
        break;
      case "d":
        ms = DateTime(d.year, d.month, d.day, 23, 59, 59);
        break;
      default:
    }
    return ms.millisecondsSinceEpoch;
  }

  /// [毫秒转DateTime]
  DateTime getDateTimeByMs({bool isUtc = false}) {
    return DateTime.fromMillisecondsSinceEpoch(this, isUtc: isUtc);
  }
}
