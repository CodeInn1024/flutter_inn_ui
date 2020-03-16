/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2020-01-11 14:40:01
 * @LastEditors: hwd
 * @LastEditTime: 2020-02-06 14:54:49
*/

import 'package:flutter_lqrui/lqr_common.dart';

class ITab extends StatefulWidget {
  /// [数据数组]
  final List list;

  /// [tab 高度]
  final double height;

  /// [标题选中态颜色]
  final Color activeColor;

  /// [标题默认态颜色]
  final Color inactiveColor;

  /// [自定义回调函数]
  final Function(int) onChange;

  /// [是否显示全部按钮]
  final bool showAll;

  final PageController controller;

  final int tabIndex;
  ITab({
    Key key,
    this.list,
    this.height = 80,
    this.activeColor = IText.color1,
    this.inactiveColor = IText.color4,
    this.onChange,
    this.controller,
    this.showAll = true,
    this.tabIndex,
  }) : super(key: key);

  @override
  _ITabState createState() => _ITabState();
}

class _ITabState extends State<ITab> {
  List<ITabData> _list = [];
  int tabIndex = 0;
  ScrollController _scontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    _list = ITabModel.fromJson({'lists': widget.list}).lists;
  }

  @override
  void didUpdateWidget (ITab oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('update---');
    tabIndex = widget.tabIndex;
  }

  @override
  void dispose() {
    _scontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scontroller,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var i = 0; i < _list.length; i++)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setTabIndex(i);
                      if (widget.onChange != null) widget.onChange(i);
                      setState(() {
                        tabIndex = i;
                      });
                      // widget.controller.animateToPage(i, duration: Duration(milliseconds: 200), curve: Curves.ease);
                      widget.controller.jumpToPage(i);
                    },
                    child: Container(
                      height: Lqr().width(widget.height),
                      margin: LqrEdge.lr(),
                      alignment: Alignment.center,
                      child: Text(
                        _list[i].name,
                        style: TextStyle(color: tabIndex == i ? widget.activeColor : widget.inactiveColor),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        widget.showAll
            ? GestureDetector(
                onTap: () => allTypeDialog(),
                child: Container(
                  height: Lqr().width(widget.height),
                  padding: LqrEdge.lr(10),
                  child: IIcon(IIcons.all, size: 36),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  void allTypeDialog() {
    return openPopup(
      transitionType: LqrPopupType.offsetBottom,
      container: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => IRouter.pop(true),
              child: Container(
                padding: LqrEdge.all(),
                child: IIcon(Icons.close, size: 64, color: IText.color3),
              ),
            ),
            Wrap(
              children: <Widget>[
                for (var i = 0; i < _list.length; i++)
                  GestureDetector(
                    onTap: () {
                      IRouter.pop(true);
                      setTabIndex(i);
                      if (widget.onChange != null) widget.onChange(i);
                      setState(() {
                        tabIndex = i;
                      });
                      // widget.controller.animateToPage(i, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      widget.controller.jumpToPage(i);
                    },
                    child: Container(
                      padding: LqrEdge.custom(lr: 20, tb: 8),
                      margin: LqrEdge.all(),
                      decoration: BoxDecoration(border: IBorder.all(3), borderRadius: BorderRadius.circular(5)),
                      child: Text(_list[i].name),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setTabIndex(int i) {
    double maxVal = _scontroller.position.maxScrollExtent;
    double val = i <= 2 ? 0.0 : i >= _list.length - 2 ? maxVal : i.toDouble() * maxVal / _list.length;
    _scontroller.position.moveTo(val, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
