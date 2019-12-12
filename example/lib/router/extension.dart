/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 15:14:10
*/

import 'package:lqrui/common/common.dart';

import 'package:lqrui/pages/extension/children/extension_line_text.dart';
import 'package:lqrui/pages/extension/children/extension_refresh.dart';
import 'package:lqrui/pages/extension/children/extension_router.dart';

class ExtensionRoute {
  static Widget get extensionLineText => ExtensionLineText();
  static Widget get extensionRefresh => ExtensionRefresh();
  static Widget get extensionRouter => ExtensionRouter();
}
