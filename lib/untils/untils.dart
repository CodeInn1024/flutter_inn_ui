/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-13 17:00:56
*/

import 'package:flutter_lqrui/lqr_common.dart';
import 'dart:ui';

MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);

class LqrUntils {
  /// [argb转16进制]
  static Color argbTo16(color) => Color(int.parse(color.substring(1, 9), radix: 16) + 0xFF000000);

  /// [screenUtil]
  static ScreenUtil screenUtil = ScreenUtil.getInstance();

  /// [屏幕宽度]
  // static double screenWidth = mediaQuery.size.width;
  static double screenWidth = screenUtil.screenWidth;

  /// [屏幕高度]
  // static double screenHeight = mediaQuery.size.height;
  static double screenHeight = screenUtil.screenHeight;

  /// [小数计算]
  static Decimal decimal(String value) => Decimal.parse(value);

  /// [精度乘法]
  static decimalMtp(List<String> value) {
    Decimal _v = Decimal.parse('1');
    value.forEach((v) => _v = _v * Decimal.parse(v));
    return _v;
  }

  /// [打印]
  static String printStr(String value) => """
  \n════════════════════════╡ Flutter Lqr UI ╞═════════════════════════════════════
  \n══╡ +++ $value +++ ╞════
  """;

  /// shijan
  static Duration duration(String value) {
    List<String> _value = value.split('|');
    int _milliseconds;
    switch (_value[1]) {
      case 'h':
        _milliseconds = int.parse(decimalMtp([_value[0], '3600000']).toString()) ;
        break;
      case 'm':
        _milliseconds = int.parse(decimalMtp([_value[0], '60000']).toString());
    print(_milliseconds);
        break;
      case 's':
        _milliseconds = int.parse(decimalMtp([_value[0], '1000']).toString());
        break;
      case 'ms':
        _milliseconds = int.parse(decimalMtp([_value[0]]).toString());
        break;
      default:
        throw FormatException(printStr('参数单位错误！'));
        break;
    }
    return Duration(milliseconds: _milliseconds);
  }
}
