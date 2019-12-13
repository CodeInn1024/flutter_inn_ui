/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-13 15:54:01
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-13 17:59:57
*/
import 'package:flutter_lqrui/lqr_common.dart';

class LqrDialog {
  /// [closePopup]: 是否在点击遮罩层后关闭
  ///
  /// [title]: 标题
  ///
  /// [titleWidget]: 自定义标题栏
  ///
  /// [message]: 内容
  ///
  /// [messageWidget]: 自定义内容栏
  ///
  /// radios: 圆角大小
  static openDialog({
    bool closePopup = true, 
    String title = '标题',
    Widget titleWidget,
    String message = '内容',
    Widget messageWidget,
    double radios = 30,
  }) {
    return LqrPopup.openPopup(
      container: ClipRRect(
        borderRadius: LqrBorder.radius(size: radios),
        child: Container(
          width: Lqr.ui.width(600),
          height: Lqr.ui.width(400),
          color: Colors.white,
          padding: LqrEdge.edgeA(),
          child: Column(
            children: <Widget>[
              titleWidget ?? Text(title,style:TextStyle(fontSize: Lqr.ui.size(32))),
            ],
          ),
        ),
      ),
    );
  }
}
