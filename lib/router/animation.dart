/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-02 09:04:31
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:49:50
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrRouterTransition {
  static Route cupertino(LqrRouterClass route) => CupertinoPageRoute(
        builder: (BuildContext context) => route.widget,
        title: route.title,
        settings: new RouteSettings(
          name: route.path,
          isInitialRoute: false,
        ),
      );

  static Route material(LqrRouterClass route) => MaterialPageRoute(
        builder: (BuildContext context) => route.widget,
        settings: RouteSettings(
          name: route.path,
          isInitialRoute: false,
        ),
      );
}
