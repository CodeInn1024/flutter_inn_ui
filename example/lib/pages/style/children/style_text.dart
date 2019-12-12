/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 14:44:50
*/
import 'package:lqrui/common/common.dart';

class StyleText extends StatefulWidget {
  const StyleText({Key key}) : super(key: key);
  @override
  _StyleTextState createState() => _StyleTextState();
}

class _StyleTextState extends State<StyleText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "字体"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            size,
            color,
          ],
        ),
      ),
    );
  }

  /// [字体大小]
  List<SizeClass> sizeList = [
    SizeClass(name: "说明文本 20", explain: "标签文字等关注度低的文字", size: LqrText.size20),
    SizeClass(name: "辅助文字 24", explain: "页面辅助信息，次要内容等", size: LqrText.size24),
    SizeClass(name: "正文小 26", explain: "小号页面信息，用于提示", size: LqrText.size26),
    SizeClass(name: "正文 28", explain: "页面默认字号，用于摘要或阅读文本", size: LqrText.size28),
    SizeClass(name: "小标题 32", explain: "页面小标题，首要层级显示内容", size: LqrText.size32),
    SizeClass(name: "大标题 36", explain: "页面大标题，用于结果页等单一信息页", size: LqrText.size36),
    SizeClass(name: "较大标题 40", explain: "用于图标、数字等较大显示", size: LqrText.size40),
  ];

  get size => Column(
        children: <Widget>[
          LqrCell(title: "字体大小", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeLR(size: 50),
            margin: LqrEdge.edgeB(size: 50),
            child: Column(
              children: sizeList
                  .map(
                    (v) => Padding(
                      padding: LqrEdge.edgeT(size: 50),
                      child: Column(
                        children: <Widget>[
                          Text(v.name, style: TextStyle(fontSize: v.size, color: LqrText.color1)),
                          Container(height: Lqr.ui.width(30), child: LqrBorder.divider()),
                          Text(v.explain, style: TextStyle(fontSize: LqrText.size26, color: LqrText.color3)),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );

  /// [字体颜色]
  List<SizeClass> colorList = [
    SizeClass(name: "主要文字", explain: "在别的游戏里，像我这么帅的一般都是主角哦！", color: LqrText.color1),
    SizeClass(name: "常规文字", explain: "我还以为你从来都不会选我呢。", color: LqrText.color2),
    SizeClass(name: "次要文字", explain: "你们知道最强的武器是什么？没错，就是补丁！", color: LqrText.color3),
    SizeClass(name: "占位文字", explain: "一曲终了、繁花散尽、伊人已逝，只余一声空叹。", color: LqrText.color4),
  ];

  get color => Column(
        children: <Widget>[
          LqrCell(title: "字体颜色", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeLR(size: 50),
            margin: LqrEdge.edgeB(size: 50),
            child: Column(
              children: colorList
                  .map(
                    (v) => Padding(
                      padding: LqrEdge.edgeT(size: 50),
                      child: Column(
                        children: <Widget>[
                          Text(v.explain, style: TextStyle(fontSize: LqrText.size26, color: v.color)),
                          Container(height: Lqr.ui.width(30), child: LqrBorder.divider()),
                          Text(v.name, style: TextStyle(fontSize: LqrText.size26)),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
}

class SizeClass {
  String name;
  String explain;
  double size;
  Color color;
  SizeClass({this.name, this.explain, this.size, this.color});
}
