/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-13 17:03:14
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-13 17:24:03
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
          LqrButton(
            title: '提示弹窗',
            onTap: () => LqrDialog.openDialog(),
            size: LqrButtonSize.medium,
            margin: LqrEdge.edgeL(size: 20),
          ),
        ],
      ),
    );
  }
}
