/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-10 17:46:36
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:06:22
*/

import 'package:flutter_lqrui/lqr_common.dart';

class INoticeBar extends StatefulWidget {
  final List<INoticeBarData> lists;

  /// [显示条数]
  final int count;

  /// [点击事件]
  final Function(int) onTap;

  /// [右边点击事件]
  final Function() rightTap;

  /// [左边]
  final Widget left;

  /// [新消息]
  final bool isNew;

  INoticeBar({
    Key key,
    this.lists,
    this.count = 2,
    this.onTap,
    this.left,
    this.isNew = false,
    this.rightTap,
  }) : super(key: key);

  @override
  _INoticeBarState createState() => _INoticeBarState();
}

class _INoticeBarState extends State<INoticeBar> {
  List<List<INoticeBarData>> _lists = [];

  @override
  void initState() {
    super.initState();
    _lists = widget.lists.groupToCount(widget.count);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.count * 25).toDouble() + 10,
      padding: LqrEdge.left(),
      color: Lqr.ui.backgroundColor,
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          widget.left ?? SizedBox(),
          Expanded(
            child: Container(
              margin: LqrEdge.lr(10),
              child: Swiper(
                itemBuilder: (BuildContext context, int e) {
                  List<INoticeBarData> _e = _lists[e];
                  return Padding(
                    padding: LqrEdge.tb(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        for (var i = 0; i < _e.length; i++)
                          GestureDetector(
                            onTap: () => widget.onTap(e * widget.count + i),
                            child: Row(
                              children: <Widget>[
                                ClipOval(child: Container(width: 4, height: 4, color: IText.color1)),
                                Expanded(
                                  child: Text(
                                    "  ${_e[i].title}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: IText.style1(26),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(TimelineUtil.format(_e[i].time.toInt()), style: IText.style4(24)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
                itemCount: _lists.length,
                autoplay: true,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
          SizedBox(width: Lqr.ui.width(10)),
          widget.isNew ? ClipOval(child: Container(width: Lqr().width(16), height: Lqr.ui.width(16), color: Colors.red)) : SizedBox(),
          GestureDetector(
            child: Container(
              width: Lqr.ui.width(70),
              height: Lqr.ui.width(70),
              child: IIcon(IIcons.arrowRight, color: IText.color4, size: 32),
            ),
            onTap: widget.rightTap,
          ),
        ],
      ),
    );
  }
}

class INoticeBarData {
  String id;
  String title;
  String time;
  INoticeBarData({this.id, this.title, this.time});
}
