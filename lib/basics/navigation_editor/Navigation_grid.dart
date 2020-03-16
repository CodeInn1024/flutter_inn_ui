/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-13 17:41:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:05:42
*/
import 'package:flutter_lqrui/flutter_lqrui.dart';

class NavigationGrid extends StatefulWidget {
  final List<NavigationEditorData> allLists;
  final NavigationEditorData data;
  NavigationGrid({
    Key key,
    this.allLists,
    this.data,
  }) : super(key: key);

  @override
  _NavigationGridState createState() => _NavigationGridState();
}

class _NavigationGridState extends State<NavigationGrid> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widget = [];
    for (var i = 0; i < widget.data.routes.length; i++) _widget.add(_page(widget.data.routes[i]));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: LqrEdge.all(), child: Text("常用功能")),
        Container(
          padding: LqrEdge.lr(),
          child: Wrap(
            children: <Widget>[
              ..._widget,
              _page(InnRoutes.navigationGridEditor(widget.allLists)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _page(IRouterClass _v) {
    return GestureDetector(
      onTap: () => IRouter.push(_v),
      child: Container(
        width: Lqr().width(177.5),
        child: Column(
          children: <Widget>[
            Container(
              width: Lqr().width(90),
              height: Lqr().width(90),
              margin: LqrEdge.bottom(5),
              decoration: BoxDecoration(color: _v.color, shape: BoxShape.circle),
              child: IIcon(_v.icon, color: Colors.white, size: 40),
            ),
            Text(_v.title, style: IText.style2(28)),
            SizedBox(height: Lqr().width(15)),
          ],
        ),
      ),
    );
  }
}
