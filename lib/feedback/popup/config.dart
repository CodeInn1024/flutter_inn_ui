/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-13 11:45:38
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-13 15:18:56
*/
import 'package:flutter_lqrui/lqr_common.dart';

class LqrPopupType {
  static ScaleTransition offsetCenter(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => scale(animation, child);

  static FractionalTranslation offsetLeft(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => offset(Offset(animation.value - 1, 0), child);

  static FractionalTranslation offsetRight(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => offset(Offset(1 - animation.value, 0), child);

  static FractionalTranslation offsetTop(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => offset(Offset(0, animation.value - 1), child);

  static FractionalTranslation offsetBottom(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => offset(Offset(0, 1 - animation.value), child);

  /// 移动
  static FractionalTranslation offset(Offset translation, child) => FractionalTranslation(
        translation: translation,
        child: child,
      );

  /// 缩放
  static ScaleTransition scale(Animation<double> animation, child) => ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}