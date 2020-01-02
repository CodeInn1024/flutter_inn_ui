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
  static LqrRouterClass get lineText => LqrRouterClass(widget: ExtensionLineText(), title: "横排多组排列", path: "$path/lineText");
  static LqrRouterClass get refres => LqrRouterClass(widget: ExtensionRefresh(), title: "上拉加载下拉刷新", path: "$path/refres");
  static LqrRouterClass get router => LqrRouterClass(widget: ExtensionRouter(), title: "路由", path: "$path/router");
}
