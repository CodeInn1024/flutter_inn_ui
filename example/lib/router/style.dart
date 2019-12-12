/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 16:05:07
*/
import 'package:lqrui/common/common.dart';


import 'package:lqrui/pages/style/children/style_color.dart';
import 'package:lqrui/pages/style/children/style_text.dart';
import 'package:lqrui/pages/style/children/style_border.dart';

class StyleRoute {
  static Widget get styleColor => StyleColor();
  static Widget get styleText => StyleText();
  static Widget get styleborder => StyleBorder();
}
