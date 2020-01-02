/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-13 17:03:14
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-17 08:41:43
*/
import 'package:lqrui/common/common.dart';

class BasicsDialog extends StatefulWidget {
  BasicsDialog({Key key}) : super(key: key);

  @override
  _BasicsDialogState createState() => _BasicsDialogState();
}

class _BasicsDialogState extends State<BasicsDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "Dialog弹出框"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LqrCell(title: "提示弹窗", left: LqrCellWidget.origin, background: null),
          Row(
            children: <Widget>[
              LqrButton(
                title: '提示弹窗',
                onTap: () => LqrDialog.openDialog(title: '标题'),
                size: LqrButtonSize.medium,
                margin: LqrEdge.edgeL(size: 20),
              ),
              LqrButton(
                title: '提示弹窗( 无标题 )',
                onTap: () => LqrDialog.openDialog(),
                size: LqrButtonSize.big,
                margin: LqrEdge.edgeLR(size: 10),
              ),
            ],
          ),
          LqrCell(title: "确认弹窗", left: LqrCellWidget.origin, background: null),
          LqrButton(
            title: '确认弹窗',
            onTap: () => LqrDialog.openDialog(confirmFun: () {
              print('object');
            }),
            size: LqrButtonSize.medium,
            margin: LqrEdge.edgeL(size: 20),
          ),
          LqrCell(title: "自定义标题/内容", left: LqrCellWidget.origin, background: null),
          LqrButton(
            title: '自定义标题/内容',
            onTap: () => LqrDialog.openDialog(
              showCancelButton: true,
              titleWidget: Container(
                padding: LqrEdge.edgeA(size: 20),
                child: Text('自定义标题', style: TextStyle(color: Colors.blue)),
              ),
              messageWidget: Text('自定义内容...', style: TextStyle(color: Colors.red)),
            ),
            size: LqrButtonSize.big,
            margin: LqrEdge.edgeL(size: 20),
          ),
        ],
      ),
    );
  }
}
