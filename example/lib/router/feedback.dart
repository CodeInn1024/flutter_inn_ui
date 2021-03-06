/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 18:07:03
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/basics/basics_popup.dart';
import 'package:lqrui/pages/basics/basics_dialog.dart';
import 'package:lqrui/pages/basics/basics_notify.dart';

class FeedbackRoute {
  static String path = "/feedback";

  static InnRouterClass popup() => InnRouterClass(widget: BasicsPopup(), title: "弹出层", path: "$path/popup");
  static InnRouterClass dialog() => InnRouterClass(widget: BasicsDialog(), title: "Dialog弹出框", path: "$path/dialog");
  static InnRouterClass notify() => InnRouterClass(widget: BasicsNotify(), title: "Dialog弹出框", path: "$path/notify");
}
