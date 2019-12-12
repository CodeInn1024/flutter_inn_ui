/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:38:04
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 16:04:12
*/
import 'package:lqrui/common/common.dart';

class ExtensionLineText extends StatelessWidget {
  const ExtensionLineText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "横排多组排列"),
      body: Container(
        padding: LqrEdge.edgeA(),
        child: Column(
          children: <Widget>[
            LqrLineText(data: LqrLineTextData(title: "单个", value: "我是文字")),
            Container(height: Lqr.ui.width(30)),
            LqrLineText(lists: [LqrLineTextData(title: "多个", value: "我是文字"), LqrLineTextData(title: "多个", value: "我是文字"), LqrLineTextData(title: "多个", value: "我是文字")]),
            Container(height: Lqr.ui.width(30)),
            LqrLineText(lists: [LqrLineTextData(title: "text类型", value: "我是文字"), LqrLineTextData(title: "widget类型", widget: LqrIcon(icon: LqrIconType.userSolid))]),
            Container(height: Lqr.ui.width(30)),
            LqrLineText(lists: [LqrLineTextData(title: "比例", value: "我是5", flex: 5), LqrLineTextData(title: "比例", value: "我是2", flex: 2)]),
          ],
        ),
      ),
    );
  }
}
