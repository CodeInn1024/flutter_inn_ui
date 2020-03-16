import 'package:flutter_lqrui/lqr_common.dart';

class ICell extends StatelessWidget {
  /// [图标]
  final IconData icon;

  /// [图标颜色]
  final Color iconColor;

  /// [标题]
  final String title;

  /// [右边视图]
  final Widget rightWidget;

  /// [右边文字]
  final String rightText;

  /// [内边距]
  final EdgeInsetsGeometry padding;

  /// [点击事件]
  final Function onTap;

  const ICell({
    Key key,
    @required this.title,
    this.icon,
    this.iconColor,
    this.rightWidget,
    this.rightText,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Lqr.ui.width(92),
        padding: padding ?? LqrEdge.lr(Lqr.ui.edgeInsets),
        decoration: BoxDecoration(
          border: IBorder.bottom(1),
        ),
        child: Row(
          children: <Widget>[
            icon == null
                ? SizedBox()
                : Padding(
                    padding: LqrEdge.right(Lqr.ui.edgeInsets),
                    child: IIcon(icon, color: iconColor ?? LqrColor.green),
                  ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Text(title, style: IText.style2(28))),
                  rightText == null ? SizedBox() : Text(rightText, style: IText.style4(24)),
                  rightWidget ?? IIcon(IIcons.arrowRight, color: IText.color4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
