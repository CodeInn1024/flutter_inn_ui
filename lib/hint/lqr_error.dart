/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:07:58
*/
import 'package:flutter_lqrui/lqr_common.dart';

class LqrError extends StatelessWidget {
  final String errorText;

  LqrError({
    Key key,
    this.errorText = '发生错误，请联系开发商',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: LqrUntils.screenWidth,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IIcon(IIcons.nodata, size: 160, color: IText.color3),
            Container(
              padding: LqrEdge.top(30),
              child: Text(
                errorText,
                style: IText.style3(28),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
