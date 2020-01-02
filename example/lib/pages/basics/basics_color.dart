/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:57:50
*/
import 'package:lqrui/common/common.dart';

class BasicsColor extends StatefulWidget {
  const BasicsColor({Key key}) : super(key: key);
  @override
  _BasicsColorState createState() => _BasicsColorState();
}

class _BasicsColorState extends State<BasicsColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "颜色"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            dark,
            light,
            gradient,
          ],
        ),
      ),
    );
  }

  /// [深色背景]
  List<ColorClass> darkList = [
    ColorClass(name: "嫣红", type: "red", color: LqrColor.red, shadow: LqrShadow.red),
    ColorClass(name: "桔橙", type: "orange", color: LqrColor.orange, shadow: LqrShadow.red),
    ColorClass(name: "明黄", type: "yellow", color: LqrColor.yellow, shadow: LqrShadow.red),
    ColorClass(name: "橄榄", type: "olive", color: LqrColor.olive, shadow: LqrShadow.red),
    ColorClass(name: "森绿", type: "green", color: LqrColor.green, shadow: LqrShadow.red),
    ColorClass(name: "天青", type: "cyan", color: LqrColor.cyan, shadow: LqrShadow.red),
    ColorClass(name: "海蓝", type: "blue", color: LqrColor.blue, shadow: LqrShadow.red),
    ColorClass(name: "姹紫", type: "purple", color: LqrColor.purple, shadow: LqrShadow.red),
    ColorClass(name: "木槿", type: "mauve", color: LqrColor.mauve, shadow: LqrShadow.red),
    ColorClass(name: "桃粉", type: "pink", color: LqrColor.pink, shadow: LqrShadow.red),
    ColorClass(name: "棕褐", type: "brown", color: LqrColor.brown, shadow: LqrShadow.red),
    ColorClass(name: "玄灰", type: "grey", color: LqrColor.grey, shadow: LqrShadow.red),
    ColorClass(name: "草灰", type: "gray", color: LqrColor.gray, shadow: LqrShadow.red),
    ColorClass(name: "墨黑", type: "black", color: LqrColor.black, shadow: LqrShadow.red),
    ColorClass(name: "暗灰", type: "darkGray", color: LqrColor.darkGray, shadow: LqrShadow.red),
  ];

  get dark => Column(
        children: <Widget>[
          LqrCell(title: "深色背景", left: LqrCellWidget.origin),
          GridView.builder(
            padding: LqrEdge.edgeH(lr: 50, tb: 50),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: Lqr.ui.width(50),
              crossAxisSpacing: Lqr.ui.width(50),
              childAspectRatio: 1.2,
            ),
            itemCount: darkList.length,
            itemBuilder: (BuildContext context, int i) {
              ColorClass v = darkList[i];
              return Container(
                decoration: BoxDecoration(
                  color: v.color,
                  borderRadius: LqrBorder.radius(),
                  boxShadow: [v.shadow],
                ),
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: LqrText.size32, color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(v.name),
                      Container(height: Lqr.ui.width(10)),
                      Text(v.type),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );

  /// [浅色背景]
  List<ColorClass> lightList = [
    ColorClass(name: "嫣红", type: "red", color: LqrColor.redL, textColor: LqrColor.red),
    ColorClass(name: "桔橙", type: "orange", color: LqrColor.orangeL, textColor: LqrColor.orange),
    ColorClass(name: "明黄", type: "yellow", color: LqrColor.yellowL, textColor: LqrColor.yellow),
    ColorClass(name: "橄榄", type: "olive", color: LqrColor.oliveL, textColor: LqrColor.olive),
    ColorClass(name: "森绿", type: "green", color: LqrColor.greenL, textColor: LqrColor.green),
    ColorClass(name: "天青", type: "cyan", color: LqrColor.cyanL, textColor: LqrColor.cyan),
    ColorClass(name: "海蓝", type: "blue", color: LqrColor.blueL, textColor: LqrColor.blue),
    ColorClass(name: "姹紫", type: "purple", color: LqrColor.purpleL, textColor: LqrColor.purple),
    ColorClass(name: "木槿", type: "mauve", color: LqrColor.mauveL, textColor: LqrColor.mauve),
    ColorClass(name: "桃粉", type: "pink", color: LqrColor.pinkL, textColor: LqrColor.pink),
    ColorClass(name: "棕褐", type: "brown", color: LqrColor.brownL, textColor: LqrColor.brown),
    ColorClass(name: "玄灰", type: "grey", color: LqrColor.greyL, textColor: LqrColor.grey),
  ];

  get light => Column(
        children: <Widget>[
          LqrCell(title: "浅色背景", left: LqrCellWidget.origin),
          GridView.builder(
            padding: LqrEdge.edgeH(lr: 50, tb: 50),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: Lqr.ui.width(50),
              crossAxisSpacing: Lqr.ui.width(50),
              childAspectRatio: 1.2,
            ),
            itemCount: lightList.length,
            itemBuilder: (BuildContext context, int i) {
              ColorClass v = lightList[i];
              return Container(
                decoration: BoxDecoration(
                  color: v.color,
                  borderRadius: LqrBorder.radius(),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: LqrText.size32, color: v.textColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(v.name),
                      Container(height: Lqr.ui.width(10)),
                      Text(v.type),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );

  /// [渐变背景]
  List<ColorClass> gradientList = [
    ColorClass(name: "魅红", type: "f43f3b - ec008c", gradient: LqrGradient.linear45(LqrColor.redG)),
    ColorClass(name: "鎏金", type: "ff9700 - ed1c24", gradient: LqrGradient.linear45(LqrColor.orangeG)),
    ColorClass(name: "翠柳", type: "39b54a - 8dc63f", gradient: LqrGradient.linear45(LqrColor.greenG)),
    ColorClass(name: "靛青", type: "0081ff - 1cbbb4", gradient: LqrGradient.linear45(LqrColor.blueG)),
    ColorClass(name: "惑紫", type: "9000ff - 5e00ff", gradient: LqrGradient.linear45(LqrColor.purpleG)),
    ColorClass(name: "霞彩", type: "ec008c - 6739b6", gradient: LqrGradient.linear45(LqrColor.pinkG)),
  ];

  get gradient => Column(
        children: <Widget>[
          LqrCell(title: "渐变背景", left: LqrCellWidget.origin),
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
            itemCount: gradientList.length,
            itemBuilder: (BuildContext context, int i) {
              ColorClass v = gradientList[i];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: LqrBorder.radius(),
                  gradient: v.gradient,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: LqrText.size32, color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(v.name),
                      Container(height: Lqr.ui.width(10)),
                      Text(v.type),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
}

class ColorClass {
  String name;
  String type;
  Color color;
  Color textColor;
  BoxShadow shadow;
  Gradient gradient;
  ColorClass({this.name, this.color, this.type, this.textColor, this.shadow, this.gradient});
}
