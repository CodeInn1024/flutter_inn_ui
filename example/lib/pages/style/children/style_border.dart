/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 14:43:46
*/
import 'package:lqrui/common/common.dart';

class StyleBorder extends StatefulWidget {
  const StyleBorder({Key key}) : super(key: key);
  @override
  _StyleBorderState createState() => _StyleBorderState();
}

class _StyleBorderState extends State<StyleBorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "边框阴影"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            size,
            radius,
          ],
        ),
      ),
    );
  }

  /// [边框颜色]
  List<BorderClass> colorList = [
    BorderClass(name: "一级边框", color: LqrBorder.ui.color1),
    BorderClass(name: "二级边框", color: LqrBorder.ui.color2),
    BorderClass(name: "三级边框", color: LqrBorder.ui.color3),
    BorderClass(name: "四级边框", color: LqrBorder.ui.color4),
  ];

  get size => Column(
        children: <Widget>[
          LqrCell(title: "边框颜色", left: LqrCellWidget.origin),
          Container(
            color: Colors.white,
            margin: LqrEdge.edgeB(),
            child: GridView.builder(
              padding: LqrEdge.edgeH(lr: 50, tb: 50),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Lqr.ui.width(50),
                crossAxisSpacing: Lqr.ui.width(50),
                childAspectRatio: 2.1,
              ),
              itemCount: colorList.length,
              itemBuilder: (BuildContext context, int i) {
                BorderClass v = colorList[i];
                return Container(
                  margin: LqrEdge.edgeT(),
                  alignment: Alignment.center,
                  width: Lqr.ui.width(400),
                  height: Lqr.ui.width(200),
                  decoration: BoxDecoration(border: LqrBorder.borderA(1, color: v.color)),
                  child: Text(v.name),
                );
              },
            ),
          ),
        ],
      );

  /// [圆角]
  List<BorderClass> radiusList = [
    BorderClass(name: "小圆角", radius: LqrBorder.radius(size: LqrBorder.ui.radius1)),
    BorderClass(name: "中圆角", radius: LqrBorder.radius(size: LqrBorder.ui.radius2)),
    BorderClass(name: "大圆角", radius: LqrBorder.radius(size: LqrBorder.ui.radius3)),
    BorderClass(name: "特大圆角", radius: LqrBorder.radius(size: LqrBorder.ui.radius4)),
    BorderClass(name: "上圆角", radius: LqrBorder.radiusT(size: LqrBorder.ui.radius4)),
    BorderClass(name: "下圆角", radius: LqrBorder.radiusB(size: LqrBorder.ui.radius4)),
  ];

  get radius => Column(
        children: <Widget>[
          LqrCell(title: "圆角", left: LqrCellWidget.origin),
          GridView.builder(
            padding: LqrEdge.edgeH(lr: 50, tb: 50),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Lqr.ui.width(50),
              crossAxisSpacing: Lqr.ui.width(50),
              childAspectRatio: 2.1,
            ),
            itemCount: radiusList.length,
            itemBuilder: (BuildContext context, int i) {
              BorderClass v = radiusList[i];
              return Container(
                margin: LqrEdge.edgeT(),
                alignment: Alignment.center,
                width: Lqr.ui.width(400),
                height: Lqr.ui.width(200),
                decoration: BoxDecoration(
                  border: LqrBorder.borderA(1, color: LqrColor.red),
                  borderRadius: v.radius,
                ),
                child: Text(v.name),
              );
            },
          ),
        ],
      );
}

class BorderClass {
  String name;
  Color color;
  BorderRadiusGeometry radius;
  BorderClass({this.name, this.color, this.radius});
}
