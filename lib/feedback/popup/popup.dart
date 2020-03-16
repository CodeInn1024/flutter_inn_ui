import 'package:flutter_lqrui/lqr_common.dart';

class IPopup {
  ///  [弹窗]
  ///
  /// container: 展示框
  ///
  /// position: 弹出位置(center、left、right、top、bottom),默认为center
  ///
  /// transitionType: 动画类型
  ///
  /// barrierColor: 遮罩颜色
  ///
  /// transitionTime: 动画时长  ['value (值) | unit (单位)']
  ///
  /// overlay: 是否显示遮罩层
  ///
  /// closePopup: 是否在点击遮罩层后关闭
  ///
  /// duration: 展示时长(单位: 秒(s) )   默认永久
  static Future popup({
    @required Widget container,
    AlignmentGeometry position = Alignment.center,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) popupType = LqrPopupType.offsetCenter,
    Color barrierColor = Colors.black26,
    String transitionTime = '200|ms',
    bool overlay = true,
    bool closePopup = true,
    int duration,
  }) =>
      showGeneralDialog(
        context: Lqr.ui.scaffoldCtx,
        pageBuilder: (buildContext, animation, secondaryAnimation) {
          return Page(
            duration: duration,
            container: container,
            position: position,
            closePopup: closePopup,
          );
        },
        barrierDismissible: closePopup, // 是否可以点击背景关闭
        barrierLabel: MaterialLocalizations.of(Lqr.ui.scaffoldCtx).modalBarrierDismissLabel,
        barrierColor: overlay ? barrierColor : Color(0x00ffffff), // 背景颜色
        transitionDuration: LqrUntils.duration(transitionTime), // 动画时间
        transitionBuilder: popupType,
      );
}

class Page extends StatefulWidget {
  final int duration;
  final Widget container;
  final AlignmentGeometry position;
  final bool closePopup;
  Page({
    Key key,
    this.duration,
    this.container,
    this.position,
    this.closePopup,
  }) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  Timer _timer;
  int _duration;

  @override
  void initState() {
    _duration = widget.duration;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StatefulBuilder(builder: (buildContext, StateSetter setState) {
        if (widget.duration != null) {
          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            _duration--;
            if (_duration <= 0) IRouter.pop();
          });
        }
        return GestureDetector(
          onTap: () => widget.closePopup ? IRouter.pop(null) : {},
          child: Container(
            height: LqrUntils.screenHeight,
            width: LqrUntils.screenWidth,
            color: Colors.transparent,
            alignment: widget.position,
            child: GestureDetector(
              onTap: () => {},
              child: widget.container,
            ),
          ),
        );
      }),
    );
  }
}
