import 'package:flutter_lqrui/lqr_common.dart';

class Popup {
 static  Future popup({
    bool barrierDismissible = true,
    Color barrierColor = Colors.black26,
    String transitionTime,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) popupType,
    Widget Function(BuildContext, Animation<double>, Animation<double>) builder,
  }) =>
      showGeneralDialog(
        context: Lqr.ui.scaffoldCtx,
        pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Scaffold(
              // 获取状态栏高度,并设置
              // appBar: PreferredSize(
              //   preferredSize: Size.fromHeight(MediaQueryData.fromWindow(window).padding.top),
              //   child: SafeArea(
              //     top: true,
              //     child: Offstage(),
              //   ),
              // ),
              backgroundColor: Colors.transparent,
              body: builder(buildContext, animation, secondaryAnimation));
        },
        barrierDismissible: barrierDismissible, // 是否可以点击背景关闭
        barrierLabel: MaterialLocalizations.of(Lqr.ui.scaffoldCtx).modalBarrierDismissLabel,
        barrierColor: barrierColor, // 背景颜色
        transitionDuration: LqrUntils.duration(transitionTime), // 动画时间
        transitionBuilder: popupType,
      );
}
