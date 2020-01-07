/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-07 16:02:29
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/basics/basics_input.dart';
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
  static InnRouterClass input() => InnRouterClass(widget: BasicsInput(), title: "输入框", path: "$path/input");
  static InnRouterClass button() => InnRouterClass(widget: BasicsButton(), title: "按钮", path: "$path/button");
  static InnRouterClass radio() => InnRouterClass(widget: BasicsRadio(), title: "单选框", path: "$path/radio");
  static InnRouterClass image() => InnRouterClass(widget: BasicsImage(), title: "图片", path: "$path/image");
  static InnRouterClass icon() => InnRouterClass(widget: BasicsIcon(), title: "图标", path: "$path/icon");
  static InnRouterClass inputNumber() => InnRouterClass(widget: BasicsInputNumber(), title: "计数器", path: "$path/inputNumber");
  static InnRouterClass checkbox() => InnRouterClass(widget: BasicsCheckbox(), title: "多选框", path: "$path/checkbox");
  static InnRouterClass collapse() => InnRouterClass(widget: BasicsCollapse(), title: "折叠面板", path: "$path/collapse");
  static InnRouterClass color() => InnRouterClass(widget: BasicsColor(), title: "颜色", path: "$path/color");
  static InnRouterClass border() => InnRouterClass(widget: BasicsBorder(), title: "边框", path: "$path/border");
  static InnRouterClass text() => InnRouterClass(widget: BasicsText(), title: "文字", path: "$path/text");
}
