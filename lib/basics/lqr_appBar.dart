/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:00:10
*/

import 'package:flutter_lqrui/flutter_lqrui.dart';
import 'package:flutter_lqrui/lqr_common.dart';

class LqrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;

  /// [左边小部件]
  final Widget leading;

  /// [标题]
  final String title;

  final Widget titleWidget;

  /// [右边小部件]
  final List<Widget> actions;

  final Brightness brightness;

  final Color backgroundColor;

  final Color textColor;

  final Gradient gradient;

  LqrAppBar({
    Key key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title = "",
    this.titleWidget,
    this.actions,
    this.brightness = Brightness.light,
    this.backgroundColor = Colors.white,
    this.textColor = IText.color1,
    this.gradient,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return new Size.fromHeight(Lqr.ui.width(90));
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    return AppBar(
      brightness: brightness,
      title: titleWidget ?? Text(title, style: TextStyle(color: textColor, fontSize: Lqr.ui.size(36), fontWeight: FontWeight.w300)),
      backgroundColor: backgroundColor,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: gradient, color: backgroundColor),
      ),
      elevation: 0,
      iconTheme: IconThemeData(color: textColor),
      centerTitle: true,
      leading: leading ??
          (canPop
              ? IconButton(
                  icon: Icon(Icons.chevron_left, color: textColor),
                  iconSize: Lqr.ui.size(60),
                  onPressed: () => Navigator.pop(context ?? Lqr.ui.scaffoldCtx),
                )
              : null),
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
    );
  }
}
