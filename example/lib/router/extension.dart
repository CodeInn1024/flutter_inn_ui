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

class ExtensionRoute {
  static Widget get extensionLineText => ExtensionLineText();
  static Widget get extensionRefresh => ExtensionRefresh();
  static Widget get extensionRouter => ExtensionRouter();
}

// class APPRoute {
//   static const String extensionLineText = '/extensionLineText';

//   static pushExtensionLineText(String id) async {
//     return await Navigator.pushNamed(Lqr.ui.scaffoldCtx, extensionLineText,
//         arguments: ExtensionLineText(
//           id: id,
//         ));
//   }

//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case extensionLineText:
//         ExtensionLineText a = settings.arguments;
//         return MaterialPageRoute(builder: (context) => ExtensionLineText(id: a.id));
//         break;
//       default:
//         return MaterialPageRoute(builder: (context) => ExtensionLineText());
//     }
//   }
// }
