/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 18:08:12
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/basics/basics_button.dart';
import 'package:lqrui/pages/basics/basics_radio.dart';
import 'package:lqrui/pages/basics/basics_image.dart';
import 'package:lqrui/pages/basics/basics_icon.dart';
import 'package:lqrui/pages/basics/basics_input_number.dart';
import 'package:lqrui/pages/basics/basics_checkbox.dart';
import 'package:lqrui/pages/basics/basics_collapse.dart';
import 'package:lqrui/pages/basics/basics_color.dart';
import 'package:lqrui/pages/basics/basics_border.dart';
import 'package:lqrui/pages/basics/basics_text.dart';

class BasicsRoute {
  static String path = "/basics";
  static LqrRouterClass button() => LqrRouterClass(widget: BasicsButton(), title: "按钮", path: "$path/button");
  static LqrRouterClass radio() => LqrRouterClass(widget: BasicsRadio(), title: "单选框", path: "$path/radio");
  static LqrRouterClass image() => LqrRouterClass(widget: BasicsImage(), title: "图片", path: "$path/image");
  static LqrRouterClass icon() => LqrRouterClass(widget: BasicsIcon(), title: "图标", path: "$path/icon");
  static LqrRouterClass inputNumber() => LqrRouterClass(widget: BasicsInputNumber(), title: "计数器", path: "$path/inputNumber");
  static LqrRouterClass checkbox() => LqrRouterClass(widget: BasicsCheckbox(), title: "多选框", path: "$path/checkbox");
  static LqrRouterClass collapse() => LqrRouterClass(widget: BasicsCollapse(), title: "折叠面板", path: "$path/collapse");
  static LqrRouterClass color() => LqrRouterClass(widget: BasicsColor(), title: "颜色", path: "$path/color");
  static LqrRouterClass border() => LqrRouterClass(widget: BasicsBorder(), title: "边框", path: "$path/border");
  static LqrRouterClass text() => LqrRouterClass(widget: BasicsText(), title: "文字", path: "$path/text");
}
