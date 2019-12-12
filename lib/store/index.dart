/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 11:50:22
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-03 15:41:10
*/
import 'package:flutter_lqrui/lqr_common.dart';

class Store {
  static T valueNotCtx<T>() {
    return Provider.of<T>(Lqr.ui.scaffoldCtx);
  }

  static T value<T>(context, {scope}) {
    return Provider.of<T>(context);
  }

  static connect<T>({builder, child, scope}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
