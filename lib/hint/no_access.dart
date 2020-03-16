/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:08:26
*/
import 'package:flutter/widgets.dart';
import 'package:flutter_lqrui/lqr_common.dart';

class NoAccess extends StatefulWidget {
  final params;
  NoAccess({Key key, this.params}) : super(key: key);
  @override
  _NoAccessState createState() => _NoAccessState();
}

class _NoAccessState extends State<NoAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('权限不足'), elevation: 0),
      body: Container(
        width: LqrUntils.screenWidth,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IIcon(IIcons.permission, color: IText.color2, size: 160),
            Container(
              padding: LqrEdge.bottom(50),
              margin: LqrEdge.lr(160),
              child: Text(
                '此功能为企业管理员专享功能，需要加入企业，并由企业管理人授权',
                style: IText.style2(26),
                textAlign: TextAlign.center,
              ),
            ),
            // Lqr.ui.button('马上绑定', width: 250, ontap: () => IRouter(context, Routes.companySearch())),
          ],
        ),
      ),
    );
  }
}
