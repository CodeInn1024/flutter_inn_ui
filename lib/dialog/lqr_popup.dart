/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-12 11:38:09
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-12 18:06:33
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrPopup {
  /// container: 展示框
  ///
  /// position: 弹出位置(center、left、right、top、bottom),默认为center
  ///
  /// barrierColor: 遮罩颜色
  /// 
  /// overlay: 是否显示遮罩层
  static openPopup({
    Widget container,
    AlignmentGeometry position = Alignment.center,
    Color barrierColor = Colors.black54,
    bool overlay = true,
  }) =>
      showCustomDialog<bool>(
        context: Lqr.ui.scaffoldCtx,
        barrierColor: overlay ? barrierColor : Color(0x00ffffff),
        builder: (context) {
          return Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: LqrUntils.screenHeight,
                    width: LqrUntils.screenWidth,
                    color: Colors.transparent,
                    alignment: position,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
}

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  Color barrierColor = Colors.black54,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: barrierColor, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
