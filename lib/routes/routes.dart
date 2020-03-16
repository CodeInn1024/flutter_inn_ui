/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-24 10:12:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 11:21:08
*/

import 'package:flutter_lqrui/flutter_lqrui.dart';
import 'package:flutter_lqrui/basics/navigation_editor/navigation_grid_editor.dart';

class InnRoutes {
  static String path = "/inn";
  static IRouterClass navigationGridEditor(List<NavigationEditorData> lists) => IRouterClass(
        widget: NavigationGridEditor(lists),
        path: "$path/navigationGridEditor",
        title: "全部",
        color: Lqr.ui.primaryColor,
        icon: IIcons.all,
      );
}
