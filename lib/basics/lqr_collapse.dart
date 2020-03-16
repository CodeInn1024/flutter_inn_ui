/*
 * @Description: 折叠面板
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-10 14:39:45
 * @LastEditors: hwd
 * @LastEditTime: 2020-02-03 15:08:17
*/
import 'package:flutter_lqrui/lqr_common.dart';

class LqrCollapse extends StatefulWidget {
  /// [标签左右margin]
  final double marginLR;

  /// [标题栏左侧Widget]
  final Widget leftWidget;

  /// [标题栏中部Widget]
  final Widget centerWidget;

  /// [子元素Widget]
  final Widget children;

  /// [标题]
  final String title;

  /// [标题样式]
  final TextStyle titleStyle;

  /// [标题对齐方式]
  final TextAlign titleAlignment;

  /// [子元素text]
  final String childrenText;

  /// [子元素对齐方式]
  final CrossAxisAlignment childrenAlignment;

  /// [标题栏高度]]
  final double height;

  /// [右侧按钮自定义(context, active)]
  final Widget Function(BuildContext context, bool active) rightBuilder;

  /// [默认是否展开]
  final bool isOpen;
  LqrCollapse({
    Key key,
    this.marginLR = 20,
    Widget leftWidget,
    this.centerWidget,
    this.title,
    TextStyle titleStyle,
    this.childrenText,
    this.children,
    this.titleAlignment = TextAlign.left,
    this.childrenAlignment = CrossAxisAlignment.start,
    this.height = 88,
    Widget rightBuilder,
    this.isOpen = false,
  })  : leftWidget = leftWidget ?? Container(),
        titleStyle = titleStyle ?? TextStyle(fontSize: Lqr.ui.size(28)),
        rightBuilder = rightBuilder ?? btns,
        super(key: key);

  @override
  _LqrCollapseState createState() => _LqrCollapseState();
}

class _LqrCollapseState extends State<LqrCollapse> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  AnimationController _controller;
  Animation<double> _heightFactor;
  bool _childrenShow;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _childrenShow = widget.isOpen;
    _heightFactor = _controller.drive(_easeInTween);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _childrenShow = !_childrenShow;
      if (_childrenShow) {
        _controller.reset();
        _controller.forward();
      } else {
        _controller.reverse();
      }
      PageStorage.of(context)?.writeState(context, _childrenShow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: widget.childrenAlignment,
        children: <Widget>[
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: _handleTap,
              highlightColor: Colors.black12,
              splashColor: Colors.black12,
              borderRadius: BorderRadius.circular(Lqr.ui.width(0)),
              child: GestureDetector(
                child: Container(
                  margin: LqrEdge.left(widget.marginLR),
                  height: Lqr.ui.width(widget.height),
                  decoration: BoxDecoration(border: IBorder.bottom(2)),
                  child: Row(
                    children: <Widget>[
                      widget.leftWidget,
                      Expanded(
                        child: widget.centerWidget ??
                            Text(
                              widget.title,
                              textAlign: widget.titleAlignment,
                              style: widget.titleStyle,
                            ),
                      ),
                      Container(
                        margin: LqrEdge.right(widget.marginLR),
                        child: widget.rightBuilder(context, _childrenShow),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          builder(),
          IBorder.divider(),
        ],
      ),
    );
  }

  Widget builder() {
    final bool closed = !_childrenShow;
    return AnimatedBuilder(
      animation: _heightFactor,
      builder: (BuildContext context, Widget child) {
        return ClipRect(
          child: Align(
            heightFactor: closed ? _heightFactor.value : 1.0,
            child: widget.children ??
                Container(
                  padding: LqrEdge.all(30),
                  child: Text(
                    widget.childrenText,
                    style: IText.style3(28),
                  ),
                ),
          ),
        );
      },
      child: closed ? null : widget.children,
    );
  }
}

Widget btns(context, active) => active ? IIcon(IIcons.arrowUp) : IIcon(IIcons.arrowDown);

class ChildrenDataClass {
  final String name;
  final String value;
  ChildrenDataClass({this.name, this.value});
}
