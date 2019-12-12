/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 14:48:48
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

  /// [打印]
  static String printStr(String value) => """
  \n════════════════════════╡ Flutter Lqr UI ╞═════════════════════════════════════
  \n══╡ +++ $value +++ ╞════
  """;
}
