/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 11:54:56
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-03 16:55:10
*/
import 'package:flutter_lqrui/lqr_common.dart';

class IndexStore with ChangeNotifier {
  PackageInfo packageInfo;
  String token;
  bool showSplash = true;
  int homeTabIndex = 0;

// 切换闪屏
  Future checkSplash() async {
    showSplash = !showSplash;
    notifyListeners();
  }

// token
  Future setToken(String val) async {
    token = val;
    notifyListeners();
  }

  // homeTabIndex
  Future sethomeTabIndex(int index) async {
    homeTabIndex = index;
    notifyListeners();
  }
}
