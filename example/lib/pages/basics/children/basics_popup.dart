/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-12 11:28:18
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-12 18:00:16
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
          Container(
            padding: LqrEdge.edgeA(size: 32),
            child: Text('基础用法', style: TextStyle(color: LqrText.color3)),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(),
            child: Container(              
            padding: LqrEdge.edgeH(tb: 20, lr: 32),
            color: Colors.white,
              child: Row(
                children: <Widget>[Expanded(child: Text('展示弹出层')),LqrIcon(icon: Icons.navigate_next,size: 32)],
              ),
            ),
          ),
          Container(
            padding: LqrEdge.edgeA(size: 32),
            child: Text('弹出位置', style: TextStyle(color: LqrText.color3)),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(position: Alignment.centerLeft),
            child: Container(              
            padding: LqrEdge.edgeH(tb: 20, lr: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              border: LqrBorder.border(bottom: 1)
            ),
              child: Row(
                children: <Widget>[Expanded(child: Text('左侧弹出')),LqrIcon(icon: Icons.navigate_next,size: 32)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(position: Alignment.centerRight,barrierColor:  Colors.black.withOpacity(0)),
            child: Container(              
            padding: LqrEdge.edgeH(tb: 20, lr: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              border: LqrBorder.border(bottom: 1)
            ),
              child: Row(
                children: <Widget>[Expanded(child: Text('右侧弹出')),LqrIcon(icon: Icons.navigate_next,size: 32)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(position: Alignment.topCenter),
            child: Container(              
            padding: LqrEdge.edgeH(tb: 20, lr: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              border: LqrBorder.border(bottom: 1)
            ),
              child: Row(
                children: <Widget>[Expanded(child: Text('顶部弹出')),LqrIcon(icon: Icons.navigate_next,size: 32)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => LqrPopup.openPopup(position: Alignment.bottomCenter),
            child: Container(              
            padding: LqrEdge.edgeH(tb: 20, lr: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              border: LqrBorder.border(bottom: 1)
            ),
              child: Row(
                children: <Widget>[Expanded(child: Text('底部弹出')),LqrIcon(icon: Icons.navigate_next,size: 32)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
