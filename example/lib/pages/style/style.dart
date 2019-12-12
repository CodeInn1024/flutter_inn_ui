/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:46:37
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 16:38:00
*/

import 'package:lqrui/common/common.dart';

List<HomeRouter> lists = [
  HomeRouter(name: "颜色", router: StyleRoute.styleColor),
  HomeRouter(name: "字体", router: StyleRoute.styleText),
  HomeRouter(name: "边框阴影", router: StyleRoute.styleborder),
];

class Style extends StatelessWidget {
  const Style({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/BasicsBg.png"),
            Wrap(
              runSpacing: Lqr.ui.width(35),
              spacing: Lqr.ui.width(35),
              children: lists
                  .map(
                    (v) => InkWell(
                      onTap: () => lqrRouter132(v.router),
                      child: Container(
                        width: Lqr.ui.width(305),
                        height: Lqr.ui.width(175),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: LqrBorder.radius(),
                        ),
                        child: Text(v.name),
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
