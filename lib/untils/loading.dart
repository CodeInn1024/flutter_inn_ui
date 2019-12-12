/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 11:36:46
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrLoading {
  static loading() => showDialog(
        context: Lqr.ui.scaffoldCtx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('加载中...', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          );
        },
      );
}
