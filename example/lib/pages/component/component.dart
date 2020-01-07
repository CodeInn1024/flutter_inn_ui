/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-07 16:11:56
*/

import 'package:lqrui/common/common.dart';

/// [基础组件]
List<InnRouterClass> basicsLists = [
  BasicsRoute.input(),
  BasicsRoute.color(),
  BasicsRoute.border(),
  BasicsRoute.text(),
  BasicsRoute.button(),
  BasicsRoute.checkbox(),
  BasicsRoute.collapse(),
  BasicsRoute.icon(),
  BasicsRoute.image(),
  BasicsRoute.inputNumber(),
  BasicsRoute.radio(),
];

/// [反馈组件]
List<InnRouterClass> feedback = [
  FeedbackRoute.popup(),
  FeedbackRoute.dialog(),
  FeedbackRoute.notify(),
];

List<HomeClass> homeList = [
  HomeClass(name: '基础组件', icon: LqrIcon(icon: LqrIconType.radioOn), childrenList: basicsLists),
  HomeClass(name: '表单组件', icon: LqrIcon(icon: LqrIconType.radioOn)),
  HomeClass(name: '反馈组件', icon: LqrIcon(icon: LqrIconType.radioOn), childrenList: feedback),
  HomeClass(name: '展示组件', icon: LqrIcon(icon: LqrIconType.radioOn)),
  HomeClass(name: '导航组件', icon: LqrIcon(icon: LqrIconType.radioOn)),
  HomeClass(name: '业务组件', icon: LqrIcon(icon: LqrIconType.radioOn)),
];

class Component extends StatelessWidget {
  const Component({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: LqrEdge.edgeA(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: LqrRadio(
                spacing: 0,
                radio: 5,
                groupValue: [
                  LqrRadioClass(name: '中文', value: '0'),
                  LqrRadioClass(name: 'EN', value: '1'),
                ],
                builder: (context, data, action) {
                  return Container(
                    height: Lqr.ui.width(48),
                    width: Lqr.ui.width(98),
                    color: action ? Color(0xFF1989fa) : Colors.white,
                    alignment: Alignment.center,
                    child: Text(data.name, textAlign: TextAlign.center, style: TextStyle(color: action ? Colors.white : null)),
                  );
                },
              ),
            ),
            Container(
              margin: LqrEdge.edgeLR(size: 32),
              padding: LqrEdge.edgeTB(size: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset("assets/images/logo.png", height: Lqr.ui.width(72), width: Lqr.ui.width(72)),
                      Expanded(
                        child: Container(
                          margin: LqrEdge.edgeL(size: 32),
                          child: Text('UI组件', style: TextStyle(fontSize: Lqr.ui.size(62))),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              runSpacing: Lqr.ui.width(35),
              spacing: Lqr.ui.width(35),
              children: homeList
                  .map(
                    (v) => Container(
                      decoration: BoxDecoration(
                        boxShadow: LqrShadow.boxShadow,
                      ),
                      child: ClipRRect(
                        borderRadius: LqrBorder.radius(size: 10),
                        child: LqrCollapse(
                          title: v.name,
                          height: 120,
                          marginLR: 32,
                          titleStyle: TextStyle(fontSize: Lqr.ui.size(32)),
                          childrenAlignment: CrossAxisAlignment.start,
                          children: v.childrenList != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: v.childrenList
                                      .map(
                                        (v) => InkWell(
                                          onTap: () => InnRouter.push(v),
                                          child: Container(
                                            color: Colors.white,
                                            padding: LqrEdge.edgeH(top: 20, bottom: 20, left: 32, right: 32),
                                            width: Lqr.ui.width(0.1),
                                            child: Row(
                                              children: <Widget>[Expanded(child: Text(v.title)), LqrIcon(icon: Icons.navigate_next, size: 32)],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )
                              : Container(),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class HomeClass {
  final String name;
  final LqrIcon icon;
  final List<InnRouterClass> childrenList;
  HomeClass({this.name, this.icon, this.childrenList});
}
