/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-04 08:26:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 11:18:40
*/

import 'package:flutter_lqrui/flutter_lqrui.dart';
import 'package:flutter_lqrui/lqr_common.dart';

class LqrAppBarTheme {
  static LqrAppBarTheme ui = new LqrAppBarTheme();
  final Color backgroundColor;
  final Gradient gradient;
  final Color textColor;

  const LqrAppBarTheme({
    this.backgroundColor = Colors.white,
    this.gradient,
    this.textColor = LqrText.color2,
  });
}

class LqrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final LqrAppBarTheme theme;
  final Widget leading;
  final String title;
  final Widget middle;
  final List<Widget> actions;

  LqrAppBar({
    Key key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title = "",
    this.middle,
    this.actions,
    theme,
  })  : theme = theme ?? LqrAppBarTheme.ui,
        super(key: key);

  @override
  Size get preferredSize {
    return new Size.fromHeight(Lqr.ui.width(90));
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    return AppBar(
      title: Text(title, style: TextStyle(color: theme.textColor, fontSize: Lqr.ui.size(36), fontWeight: FontWeight.w300)),
      backgroundColor: theme.backgroundColor,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: theme.gradient, color: theme.backgroundColor),
      ),
      elevation: 0,
      iconTheme: IconThemeData(color: theme.textColor),
      centerTitle: true,
      leading: leading ?? canPop
          ? IconButton(
              icon: Icon(Icons.chevron_left, color: theme.textColor),
              iconSize: Lqr.ui.size(60),
              onPressed: () => Navigator.pop(context ?? Lqr.ui.scaffoldCtx),
            )
          : Container(),
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
    );
  }
}
