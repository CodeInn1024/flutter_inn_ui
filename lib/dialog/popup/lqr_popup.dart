/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-12 11:38:09
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-13 17:53:50
*/

import 'package:flutter_lqrui/lqr_common.dart';
import './config.dart';

class LqrPopup {
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
  static openPopup({
    @required Widget container,
    AlignmentGeometry position = Alignment.center,
    Function transitionType = LqrPopupType.offsetCenter,
    Color barrierColor = Colors.black26,
    String transitionTime = '200|ms',
    bool overlay = true,
    bool closePopup = true,
  }) =>
      showCustomDialog<bool>(
        context: Lqr.ui.scaffoldCtx,
        barrierColor: overlay ? barrierColor : Color(0x00ffffff),
        transitionType: transitionType,
        transitionTime: transitionTime,
        builder: (buildContext, animation, secondaryAnimation) {
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
        },
      );
}

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
      return Scaffold(backgroundColor: Colors.transparent, body: builder(buildContext, animation, secondaryAnimation));
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: barrierColor,
    transitionDuration: LqrUntils.duration(transitionTime),
    transitionBuilder: transitionType,
    // LqrPopupType.offsetLeft
  );
}
