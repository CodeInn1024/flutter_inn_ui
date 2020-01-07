/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:24:04
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-16 10:08:50
*/
import 'package:lqrui/common/common.dart';

class Extension extends StatelessWidget {
  Extension({Key key}) : super(key: key);

  final List<InnRouterClass> lists = [
    ExtensionRoute.lineText,
    ExtensionRoute.refres,
    ExtensionRoute.router,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: '扩展'),
      body: ListView.builder(
        padding: LqrEdge.edgeLR(),
        itemCount: lists.length,
        itemBuilder: (BuildContext context, int i) {
          return LqrCell(
            title: lists[i].title,
            onTap: () {
              // Navigator.pushNamed(context, '/extensionLineText',ExtensionLineText(id));
              // APPRoute.pushExtensionLineText("13213132");
              // InnRouter132(lists[i].router);
              InnRouter.push(lists[i]);
            },
            margin: LqrEdge.edgeT(),
            background: LqrColor.blue,
            titleColor: Colors.white,
            borderRadius: LqrBorder.radius(),
          );
        },
      ),
    );
  }
}
