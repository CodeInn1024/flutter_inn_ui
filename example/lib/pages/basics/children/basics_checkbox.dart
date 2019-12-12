/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 09:22:06
*/

import 'package:lqrui/common/common.dart';

class BasicsCheckbox extends StatefulWidget {
  const BasicsCheckbox({Key key}) : super(key: key);
  @override
  _BasicsCheckboxState createState() => _BasicsCheckboxState();
}

class _BasicsCheckboxState extends State<BasicsCheckbox> {
  List<LqrCheckboxClass> groupValue = [
    LqrCheckboxClass(name: "北京", value: "1"),
    LqrCheckboxClass(name: "上海", value: "2"),
    LqrCheckboxClass(name: "广州", value: "3"),
    LqrCheckboxClass(name: "深圳", value: "4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "多选框"),
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
            child: LqrCheckbox(
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
            child: LqrCheckbox(
              groupValue: groupValue,
              type: LqrCheckboxType.button,
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
            child: LqrCheckbox(
              groupValue: groupValue,
              builder: (conntext, data, active) {
                return LqrCell(
                  title: "自定义样式",
                  right: active ? LqrCheckboxOn() : LqrCheckboxOff(),
                );
              },
            ),
          ),
        ],
      );
}
