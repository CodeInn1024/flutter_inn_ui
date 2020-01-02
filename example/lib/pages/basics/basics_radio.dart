/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 17:57:31
*/
import 'package:lqrui/common/common.dart';

class BasicsRadio extends StatefulWidget {
  const BasicsRadio({Key key}) : super(key: key);
  @override
  _BasicsRadioState createState() => _BasicsRadioState();
}

class _BasicsRadioState extends State<BasicsRadio> {
  List<LqrRadioClass> groupValue = [
    LqrRadioClass(name: "北京", value: "1"),
    LqrRadioClass(name: "上海", value: "2"),
    LqrRadioClass(name: "广州", value: "3"),
    LqrRadioClass(name: "深圳", value: "4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "单选框"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          basics,
          button,
          builder,
        ],
      ),
    );
  }

  /// [基础用法]
  get basics => Column(
        children: <Widget>[
          LqrCell(title: "基础用法", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeH(lr: 20, tb: 50),
            child: LqrRadio(
              groupValue: groupValue,
            ),
          ),
        ],
      );

  /// [按钮样式]
  get button => Column(
        children: <Widget>[
          LqrCell(title: "按钮样式", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeH(lr: 20, tb: 50),
            child: LqrRadio(
              groupValue: groupValue,
              type: LqrRadioType.button,
            ),
          ),
        ],
      );

  /// [自定义样式]
  get builder => Column(
        children: <Widget>[
          LqrCell(title: "自定义样式", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeA(),
            child: LqrRadio(
              groupValue: groupValue,
              builder: (conntext, data, active) {
                return LqrCell(
                  title: "自定义样式",
                  right: active ? LqrRadioOn() : LqrRadioOff(),
                );
              },
            ),
          ),
        ],
      );
}
