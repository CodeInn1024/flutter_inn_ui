/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 12:06:48
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-09 17:02:12
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrBackDesktop extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  const LqrBackDesktop({Key key, this.builder}) : super(key: key);

  static const String CHANNEL = "android/back/desktop";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final platform = MethodChannel(CHANNEL);
        //通知安卓返回,到手机桌面
        try {
          final bool out = await platform.invokeMethod('backDesktop');
          if (out) debugPrint('返回到桌面');
        } on PlatformException catch (e) {
          debugPrint("通信失败(设置回退到安卓手机桌面:设置失败)");
          print(e.toString());
        }
        return false;
      },
      child: Builder(
        builder: (BuildContext scaffoldCtx) {
          MediaQuery.of(scaffoldCtx);
          return builder(scaffoldCtx);
        },
      ),
    );
  }
}
