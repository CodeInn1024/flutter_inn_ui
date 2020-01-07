/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:52:03
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/extension/children/extension_line_text.dart';
import 'package:lqrui/pages/extension/children/extension_refresh.dart';
import 'package:lqrui/pages/extension/children/extension_router.dart';

class ExtensionRoute {
  static String path = "/extension";
  static InnRouterClass get lineText => InnRouterClass(widget: ExtensionLineText(), title: "横排多组排列", path: "$path/lineText");
  static InnRouterClass get refres => InnRouterClass(widget: ExtensionRefresh(), title: "上拉加载下拉刷新", path: "$path/refres");
  static InnRouterClass get router => InnRouterClass(widget: ExtensionRouter(), title: "路由", path: "$path/router");
}
