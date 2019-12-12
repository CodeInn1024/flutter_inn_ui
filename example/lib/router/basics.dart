/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 14:58:01
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/basics/children/basics_button.dart';
import 'package:lqrui/pages/basics/children/basics_radio.dart';
import 'package:lqrui/pages/basics/children/basics_image.dart';
import 'package:lqrui/pages/basics/children/basics_icon.dart';
import 'package:lqrui/pages/basics/children/basics_input_number.dart';
import 'package:lqrui/pages/basics/children/basics_checkbox.dart';
import 'package:lqrui/pages/basics/children/basics_collapse.dart';

class BasicsRoute {
  static Widget get  basicsButton => BasicsButton();
  static Widget get basicsRadio => BasicsRadio();
  static Widget get basicsImage => BasicsImage();
  static Widget get basicsIcon => BasicsIcon();
  static Widget get basicsInputNumber => BasicsInputNumber();
  static Widget get basicsCheckbox => BasicsCheckbox();
  static Widget get basicsCollapse => BasicsCollapse();
}
