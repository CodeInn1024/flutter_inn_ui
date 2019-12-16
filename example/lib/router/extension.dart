/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-16 10:17:37
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/extension/children/extension_line_text.dart';
import 'package:lqrui/pages/extension/children/extension_refresh.dart';
import 'package:lqrui/pages/extension/children/extension_router.dart';

// class ExtensionRoute {
//   static Widget get extensionLineText => ExtensionLineText();
//   static Widget get extensionRefresh => ExtensionRefresh();
//   static Widget get extensionRouter => ExtensionRouter();
// }

class ExtensionRoute {
  static LqrRouterClass get lineText => LqrRouterClass(ExtensionLineText(), title: "横排多组排列", roles: ["admin"]);
  static LqrRouterClass get refres => LqrRouterClass(ExtensionRefresh(), title: "上拉加载下拉刷新");
  static LqrRouterClass get router => LqrRouterClass(ExtensionRouter(), title: "路由", roles: ["root"]);
}
