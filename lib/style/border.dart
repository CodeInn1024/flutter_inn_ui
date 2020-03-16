/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 16:59:34
*/

import 'package:flutter_lqrui/lqr_common.dart';

class IBorder {
  /// [一级边框] Base Border Color
  static const Color color1 = Color(0xFFDCDFE6);

  /// [二级边框] light Border Color
  static const Color color2 = Color(0xFF606266);

  /// [三级边框] lighter Border Color
  static const Color color3 = Color(0xFFEBEEF5);

  /// [四级边框] extra Border Color
  static const Color color4 = Color(0xFFF2F6FC);

  /// [自定义边框]
  static Border border({double left = 0, double top = 0, double right = 0, double bottom = 0, int colorType = 4, Color color}) => Border(
        left: left == 0 ? BorderSide.none : BorderSide(width: Lqr().width(left), color: color ?? borderColor(colorType)),
        top: top == 0 ? BorderSide.none : BorderSide(width: Lqr().width(top), color: color ?? borderColor(colorType)),
        right: right == 0 ? BorderSide.none : BorderSide(width: Lqr().width(right), color: color ?? borderColor(colorType)),
        bottom: bottom == 0 ? BorderSide.none : BorderSide(width: Lqr().width(bottom), color: color ?? borderColor(colorType)),
      );

  /// [全边框]
  static Border all(int colorType, [double width = 1]) => Border.all(width: Lqr().width(width), color: borderColor(colorType));

  /// [上边框]
  static Border top(int colorType, [double width = 1]) => Border(top: BorderSide(width: Lqr().width(width), color: borderColor(colorType)));

  /// [下边框]
  static Border bottom(int colorType, [double width = 1]) => Border(bottom: BorderSide(width: Lqr().width(width), color: borderColor(colorType)));

  /// [左边框]
  static Border left(int colorType, [double width = 1]) => Border(left: BorderSide(width: Lqr().width(width), color: borderColor(colorType)));

  /// [右边框]
  static Border right(int colorType, [double width = 1]) => Border(right: BorderSide(width: Lqr().width(width), color: borderColor(colorType)));

  /// [间距]
  static interval({double height, Color color}) => Container(height: Lqr().width(height ?? 15), color: color ?? Lqr().backgroundColor);

  /// [线]
  static divider([Color color = color1, double width = 1]) => Divider(height: Lqr().width(width), color: color, thickness: 0.9);
}

Color borderColor(int type) {
  switch (type) {
    case 1:
      return IBorder.color1;
      break;
    case 2:
      return IBorder.color1;
      break;
    case 3:
      return IBorder.color1;
      break;
    case 4:
      return IBorder.color1;
      break;
    default:
      return IBorder.color4;
  }
}

class IInterval extends StatelessWidget {
  final double width;
  const IInterval([this.width]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Lqr().width(width ?? 20));
  }
}
