/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:24:04
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 15:14:44
*/
import 'package:lqrui/common/common.dart';

class Extension extends StatelessWidget {
  Extension({Key key}) : super(key: key);

  final List<HomeRouter> lists = [
    HomeRouter(name: "横排多组排列", router: ExtensionRoute.extensionLineText),
    HomeRouter(name: "下拉刷新上拉加载", router: ExtensionRoute.extensionRefresh),
    HomeRouter(name: "路由", router: ExtensionRoute.extensionRouter),
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
            title: lists[i].name,
            onTap: () => lqrRouter132(lists[i].router),
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
