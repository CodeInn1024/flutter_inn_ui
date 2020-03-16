/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-14 10:02:19
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 10:31:35
*/
import 'package:flutter_lqrui/flutter_lqrui.dart';
export './Navigation_grid.dart';

class NavigationEditorData {
  String title;
  List<IRouterClass> routes;
  NavigationEditorData(this.title, this.routes);
}
