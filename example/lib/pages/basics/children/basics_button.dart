/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-06 15:31:07
*/
import 'package:lqrui/common/common.dart';

class BasicsButton extends StatefulWidget {
  const BasicsButton({Key key}) : super(key: key);
  @override
  _BasicsButtonState createState() => _BasicsButtonState();
}

class _BasicsButtonState extends State<BasicsButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "按钮"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            basics,
            sizeType,
          ],
        ),
      ),
    );
  }

  /// [基础用法]
  List<ButtonType> basicsList = [
    ButtonType(name: "默认按钮", type: LqrButtonType.basics),
    ButtonType(name: "主要", type: LqrButtonType.primary),
    ButtonType(name: "成功按钮", type: LqrButtonType.success),
    ButtonType(name: "信息按钮", type: LqrButtonType.info),
    ButtonType(name: "警告按钮", type: LqrButtonType.warning),
    ButtonType(name: "危险按钮", type: LqrButtonType.danger),
    ButtonType(name: "渐变按钮", type: LqrButtonType.redGradient),
  ];
  bool plain = false;
  get basics => Column(
        children: <Widget>[
          LqrCell(
            title: "基础用法",
            left: LqrCellWidget.origin,
            right: GestureDetector(
              child: Text('朴素'),
              onTap: () => setState(() => plain = !plain),
            ),
          ),
          Container(
            padding: LqrEdge.edgeH(lr: 20, tb: 50),
            child: Wrap(
                spacing: Lqr.ui.width(20),
                runSpacing: Lqr.ui.width(20),
                children: basicsList
                    .map(
                      (v) => LqrButton(
                        title: v.name,
                        plain: plain,
                        size: LqrButtonSize.small,
                        enabled: true,
                        theme: LqrButtonTheme(type: v.type),
                        onTap: () {
                          // LqrToast.toast("点击了按钮");
                        },
                      ),
                    )
                    .toList()),
          ),
        ],
      );

  /// [不同尺寸]
  List<ButtonType> sizeTypeList = [
    ButtonType(name: "迷你", type: LqrButtonType.warning, size: LqrButtonSize.mini),
    ButtonType(name: "小型", type: LqrButtonType.primary, size: LqrButtonSize.small),
    ButtonType(name: "中等", type: LqrButtonType.success, size: LqrButtonSize.medium),
    ButtonType(name: "大号", type: LqrButtonType.danger, size: LqrButtonSize.big),
  ];
  get sizeType => Column(
        children: <Widget>[
          LqrCell(title: "不同尺寸", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeH(lr: 20, tb: 50),
            child: Wrap(
                spacing: Lqr.ui.width(20),
                runSpacing: Lqr.ui.width(20),
                children: sizeTypeList
                    .map(
                      (v) => LqrButton(
                        title: v.name,
                        size: v.size,
                        theme: LqrButtonTheme(type: v.type),
                        onTap: () {
                          // LqrToast.toast("点击了按钮");
                        },
                      ),
                    )
                    .toList()),
          ),
        ],
      );
}

class ButtonType {
  String name;
  LqrButtonTypeClass type;
  LqrButtonSizeClass size;
  ButtonType({this.name, this.type, this.size});
}
