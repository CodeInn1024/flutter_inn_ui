/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-11 15:00:49
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-07 16:02:17
*/

import 'package:lqrui/common/common.dart';

class ExtensionRouter extends StatelessWidget {
  const ExtensionRouter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: '路由'),
      body: GridView.builder(
        padding: LqrEdge.edgeH(lr: 50, tb: 50),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: Lqr.ui.width(50),
          crossAxisSpacing: Lqr.ui.width(50),
          childAspectRatio: 1.1,
        ),
        itemCount: routers.length,
        itemBuilder: (BuildContext context, int i) {
          InnRouterClass v = routers[i];
          return GestureDetector(
            onTap: () => InnRouter.push(v),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: LqrBorder.radius(),
                color: LqrColor.blue,
                gradient: LqrGradient.linear45(LqrColor.redG),
              ),
              // child: DefaultTextStyle(
              //   style: TextStyle(fontSize: LqrText.size32, color: Colors.white),
              //   child: Text(v.name),
              // ),
            ),
          );
        },
      ),
    );
  }
}

List<InnRouterClass> routers = [
  // InnRouterClass(NewPage(title: '基础用法'), name: '基础用法'),
];

class NewPage extends StatelessWidget {
  final String title;
  const NewPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: title),
      body: GestureDetector(
        child: Text('data'),
        onTap: () {
          // Route<dynamic> route;
          // print( route.settings);
          // print(route.willHandlePopInternally);
          // InnRouter.pushAndRemoveUntil(ExtensionRouter());
          // Navigator.popUntil(context, ModalRoute.withName('/screen2'));
        },
      ),
    );
  }
}
