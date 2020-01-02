/*
 * @Description: popup弹出层
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-12 11:38:09
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-24 09:44:10
*/

import 'package:flutter_lqrui/lqr_common.dart';
import './config.dart';
import 'dart:ui';

/// container: 展示框
///
/// position: 弹出位置(center、left、right、top、bottom),默认为center
///
/// transitionType: 动画类型
///
/// barrierColor: 遮罩颜色
///
/// overlay: 是否显示遮罩层
///
/// closePopup: 是否在点击遮罩层后关闭
///
/// transitionTime: 动画时长  ['value (值) | unit (单位)']
///
/// duration: 展示时长(单位: 秒(s) )   默认永久
void openPopup({
  @required Widget container,
  AlignmentGeometry position = Alignment.center,
  Function transitionType = LqrPopupType.offsetCenter,
  Color barrierColor = Colors.black26,
  String transitionTime = '200|ms',
  bool overlay = true,
  bool closePopup = true,
  int duration,
}) =>
    showCustomDialog<bool>(
        context: Lqr.ui.scaffoldCtx,
        barrierColor: overlay ? barrierColor : Color(0x00ffffff),
        transitionType: transitionType,
        transitionTime: transitionTime,
        builder: (buildContext, animation, secondaryAnimation) {
          bool isTime = false;
          return StatefulBuilder(builder: (buildContext, StateSetter setState) {
            Timer _timer;
            void startCountdownTimer() {
              _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                if (duration <= 1) {
                  _timer.cancel();
                  Navigator.of(buildContext).pop();
                }
                setState(() {
                  duration--;
                  isTime = true;
                });
              });
            }

            // 启动 /关闭定时器
            if (duration != null) {
              if (!isTime) {
                startCountdownTimer();
              } else {
                _timer?.cancel();
                _timer = null;
              }
            }
            return GestureDetector(
              onTap: () => closePopup ? Navigator.of(buildContext).pop() : {},
              child: Container(
                height: LqrUntils.screenHeight,
                width: LqrUntils.screenWidth,
                color: Colors.transparent,
                alignment: position,
                child: GestureDetector(
                  onTap: () => {},
                  child: container,
                ),
              ),
            );
          });
        });

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  Color barrierColor = Colors.black26,
  final transitionType,
  String transitionTime,
  Widget Function(BuildContext, Animation<double>, Animation<double>) builder,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      return Scaffold(
          // 获取状态栏高度,并设置
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQueryData.fromWindow(window).padding.top),
            child: SafeArea(
              top: true,
              child: Offstage(),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: builder(buildContext, animation, secondaryAnimation));
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: barrierColor,
    transitionDuration: LqrUntils.duration(transitionTime),
    transitionBuilder: transitionType,
  );
}
