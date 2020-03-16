/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-13 17:41:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:05:25
*/
import 'package:flutter_lqrui/flutter_lqrui.dart';

class NavigationGridEditor extends StatefulWidget {
  final List<NavigationEditorData> lists;
  NavigationGridEditor(this.lists, {Key key}) : super(key: key);

  @override
  _NavigationGridEditorState createState() => _NavigationGridEditorState();
}

class _NavigationGridEditorState extends State<NavigationGridEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LqrAppBar(title: "全部功能"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.lists.map((v) => _page(v)).toList(),
      ),
    );
  }

  Widget _page(NavigationEditorData data) {
    List<List<IRouterClass>> _a = data.routes.groupToCount(4);
    return Padding(
      padding: LqrEdge.lr(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: Lqr.ui.width(80), alignment: Alignment.centerLeft, child: Text(data.title)),
          for (var i = 0; i < _a.length; i++)
            Container(
              decoration: BoxDecoration(
                border: IBorder.border(top: i == 0 ? 1 : 0, bottom: 1, left: 1, right: 1),
              ),
              child: Row(
                children: <Widget>[
                  for (var e = 0; e < _a[i].length; e++)
                    GestureDetector(
                      onTap: () => IRouter.push(_a[i][e]),
                      child: Container(
                        width: Lqr.ui.width(177),
                        height: Lqr.ui.width(177),
                        decoration: BoxDecoration(
                          border: IBorder.border(right: e == 3 ? 0 : 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: Lqr.ui.width(80),
                              height: Lqr.ui.width(80),
                              margin: LqrEdge.bottom(8),
                              decoration: BoxDecoration(color: _a[i][e].color, shape: BoxShape.circle),
                              child: IIcon(_a[i][e].icon, color: Colors.white, size: 30),
                            ),
                            Text(_a[i][e].title, style: IText.style2(28)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
