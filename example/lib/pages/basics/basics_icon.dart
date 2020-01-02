/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-06 15:22:51
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 16:55:31
*/

import 'package:lqrui/common/common.dart';

class BasicsIcon extends StatelessWidget {
  BasicsIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "图片缓存"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            basics,
          ],
        ),
      ),
    );
  }

  /// [自带图标]
  final List<BasicsIconClass> basicsList = [
    BasicsIconClass(name: "loading", icon: LqrIconType.loading),
    BasicsIconClass(name: "nodata", icon: LqrIconType.nodata),
    BasicsIconClass(name: "userSolid", icon: LqrIconType.userSolid),
    BasicsIconClass(name: "folderSolid", icon: LqrIconType.folderSolid),
    BasicsIconClass(name: "radioOn", icon: LqrIconType.radioOn),
    BasicsIconClass(name: "radioOff", icon: LqrIconType.radioOff),
    BasicsIconClass(name: "arrowUp", icon: LqrIconType.arrowUp),
    BasicsIconClass(name: "arrowDown", icon: LqrIconType.arrowDown),
  ];
  get basics => Column(
        children: <Widget>[
          LqrCell(title: "自带图标", left: LqrCellWidget.origin),
          GridView.builder(
            padding: LqrEdge.edgeH(lr: 50, tb: 50),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: Lqr.ui.width(50),
              crossAxisSpacing: Lqr.ui.width(50),
              childAspectRatio: 2.1,
            ),
            itemCount: basicsList.length,
            itemBuilder: (BuildContext context, int i) {
              BasicsIconClass v = basicsList[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LqrIcon(icon: v.icon),
                  Container(height: Lqr.ui.width(20)),
                  Text(v.name),
                ],
              );
            },
          ),
        ],
      );
}

class BasicsIconClass {
  String name;
  IconData icon;
  BasicsIconClass({this.name, this.icon});
}
