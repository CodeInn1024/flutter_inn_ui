/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-12 11:28:18
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-13 17:19:41
*/
import 'package:lqrui/common/common.dart';

class BasicsPopup extends StatefulWidget {
  BasicsPopup({Key key}) : super(key: key);

  @override
  _BasicsPopupState createState() => _BasicsPopupState();
}

class _BasicsPopupState extends State<BasicsPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "弹出层"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LqrCell(title: "基础用法", left: LqrCellWidget.origin, background: null),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(
              container: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.white,
              ),
            ),
            child: Container(
              padding: LqrEdge.edgeH(tb: 20, lr: 32),
              color: Colors.white,
              child: Row(
                children: <Widget>[Expanded(child: Text('展示弹出层')), LqrIcon(icon: Icons.navigate_next, size: 32)],
              ),
            ),
          ),
          LqrCell(title: "弹出位置", left: LqrCellWidget.origin, background: null),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(
              container: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.white,
              ),
              position: Alignment.centerLeft,
              transitionType: LqrPopupType.offsetLeft,
            ),
            child: Container(
              padding: LqrEdge.edgeH(tb: 20, lr: 32),
              decoration: BoxDecoration(color: Colors.white, border: LqrBorder.border(bottom: 1)),
              child: Row(
                children: <Widget>[Expanded(child: Text('左侧弹出')), LqrIcon(icon: Icons.navigate_next, size: 32)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(
              container: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.white,
              ),
              position: Alignment.centerRight,
              transitionType: LqrPopupType.offsetRight,
            ),
            child: Container(
              padding: LqrEdge.edgeH(tb: 20, lr: 32),
              decoration: BoxDecoration(color: Colors.white, border: LqrBorder.border(bottom: 1)),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('右侧弹出')),
                  LqrIcon(icon: Icons.navigate_next, size: 32),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(
              container: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.white,
              ),
              position: Alignment.topCenter,
              transitionType: LqrPopupType.offsetTop,
            ),
            child: Container(
              padding: LqrEdge.edgeH(tb: 20, lr: 32),
              decoration: BoxDecoration(color: Colors.white, border: LqrBorder.border(bottom: 1)),
              child: Row(
                children: <Widget>[Expanded(child: Text('顶部弹出')), LqrIcon(icon: Icons.navigate_next, size: 32)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(
              container: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.white,
              ),
              position: Alignment.bottomCenter,
              transitionType: LqrPopupType.offsetBottom,
            ),
            child: Container(
              padding: LqrEdge.edgeH(tb: 20, lr: 32),
              decoration: BoxDecoration(color: Colors.white, border: LqrBorder.border(bottom: 1)),
              child: Row(
                children: <Widget>[Expanded(child: Text('底部弹出')), LqrIcon(icon: Icons.navigate_next, size: 32)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
