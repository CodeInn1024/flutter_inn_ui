/*
 * @Description: dialog弹出窗
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-13 15:54:01
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-16 18:08:04
*/
import 'package:flutter_lqrui/lqr_common.dart';

class LqrDialog {
  /// closePopup: 是否在点击遮罩层后关闭
  ///
  /// title: 标题
  ///
  /// showTitle: 是否显示标题
  ///
  /// titleWidget: 自定义标题栏
  ///
  /// message: 内容
  ///
  /// messageWidget: 自定义内容栏
  ///
  /// radios: 圆角大小
  ///
  /// width: 弹窗宽度
  ///
  /// showConfirmButton: 是否显示确认按钮
  ///
  /// showCancelButton: 是否显示取消按钮
  ///
  /// confirmFun: 确认回调函数
  static openDialog({
    bool closePopup = true,
    String title,
    Widget titleWidget,
    String message = '我是内容...',
    Widget messageWidget,
    double radios = 30,
    double width = 600,
    bool showConfirmButton = true,
    bool showCancelButton = false,
    Function confirmFun,
    bool loading = false,
  }) {
    return openPopup(
      container: ClipRRect(
        borderRadius: IRadius.radius(radios),
        child: Container(
          width: Lqr.ui.width(width),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              titleWidget != null
                  ? titleWidget
                  : title != null
                      ? Padding(
                          padding: LqrEdge.custom(lr: 20, top: 20),
                          child: Text(title, style: TextStyle(fontSize: Lqr.ui.size(36))),
                        )
                      : SizedBox(),
              messageWidget ?? Container(padding: LqrEdge.custom(lr: 20, top: 20), child: Text(message)),
              Container(
                width: LqrUntils.screenWidth,
                height: Lqr.ui.width(80),
                alignment: Alignment.center,
                margin: LqrEdge.top(),
                decoration: BoxDecoration(border: IBorder.top(2)),
                child: Row(
                  children: <Widget>[
                    showCancelButton
                        ? Expanded(
                            child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => IRouter.pop(true),
                              child: Container(
                                height: Lqr().width(80),
                                decoration: BoxDecoration(border: IBorder.right(2)),
                                alignment: Alignment.center,
                                child: Text('取消'),
                              ),
                            ),
                          ))
                        : SizedBox(),
                    showConfirmButton
                        ? Expanded(
                            child: Material(
                              color: Colors.white,
                              child: InkWell(
                                onTap: confirmFun ?? () => IRouter.pop(true),
                                child: Container(
                                  height: Lqr().width(80),
                                  alignment: Alignment.center,
                                  child: Text(loading ? "加载中。。。":'确认', style: TextStyle(color: Color(0xFF1989fa))),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// child: 自定义内容widget
  ///
  /// message: 内容
  ///
  /// backgroundColor: 背景色(与type同时使用时，优先使用)
  ///
  /// type: 类型,可选值为: primary danger warning 默认: success
  ///
  /// duration: 展示时长(单位: 秒(s)) 默认: 2s
  static openNotify({
    Widget child,
    String message = '我是内容...',
    Color backgroundColor,
    String type = 'success',
    int duration = 2,
  }) {
    if (backgroundColor == null) backgroundColor = setType(type);
    return openPopup(
      container: Container(
        width: Lqr().width(0.1),
        padding: LqrEdge.all(),
        color: backgroundColor,
        child: child ?? Text(message, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
      ),
      position: Alignment.topCenter,
      transitionType: LqrPopupType.offsetTop,
      overlay: false,
      duration: duration,
    );
  }
}

Color setType(t) {
  switch (t) {
    case 'danger':
      return Colors.red;
      break;
    case 'primary':
      return Colors.blue;
      break;
    case 'success':
      return Colors.green;
      break;
    case 'warning':
      return Color(0xFFff976a);
      break;
    default:
      throw FormatException(LqrUntils.printStr('参数错误！'));
      break;
  }
}
