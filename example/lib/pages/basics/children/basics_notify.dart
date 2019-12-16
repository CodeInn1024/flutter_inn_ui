/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-16 11:53:52
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-16 12:00:25
*/
import 'package:lqrui/common/common.dart';

class BasicsNotify extends StatefulWidget {
  BasicsNotify({Key key}) : super(key: key);

  @override
  _BasicsNotifyState createState() => _BasicsNotifyState();
}

class _BasicsNotifyState extends State<BasicsNotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "Dialog弹出框"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LqrCell(title: "基础用法", left: LqrCellWidget.origin, background: null),
          LqrButton(
                title: '基础用法',
                onTap: () => LqrDialog.openNotify(),
                size: LqrButtonSize.medium,
                margin: LqrEdge.edgeL(size: 20),
              ),
          LqrCell(title: "通知类型", left: LqrCellWidget.origin, background: null),
          Row(
            children: <Widget>[
              LqrButton(
                title: '主要通知',
                onTap: () => LqrDialog.openDialog(),
                size: LqrButtonSize.medium,
                margin: LqrEdge.edgeL(size: 20),
              ),
              LqrButton(
                title: '危险通知',
                onTap: () => LqrDialog.openDialog(showTitle: false),
                size: LqrButtonSize.medium,
                margin: LqrEdge.edgeL(size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}