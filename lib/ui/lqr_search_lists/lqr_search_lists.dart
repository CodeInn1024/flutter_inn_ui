/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 16:09:33
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrSearchLists extends StatefulWidget {
  /// [内容widget]
  final Widget childItem;

  /// [搜索widget]
  final Widget searchWidget;

  /// [Controller]
  final EasyRefreshController loadingController;

  /// [标题]
  final String title;

  /// [显示搜索]
  final bool searchShow;

  /// [重置事件]
  final Function() reset;

  const LqrSearchLists({
    Key key,
    this.childItem,
    this.searchWidget,
    this.loadingController,
    this.title = "",
    this.searchShow = false,
    this.reset,
  }) : super(key: key);

  @override
  _LqrSearchListsState createState() => _LqrSearchListsState();
}

class _LqrSearchListsState extends State<LqrSearchLists> {
  bool _searchShow;

  @override
  void initState() {
    super.initState();
    _searchShow = widget.searchShow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(
        title: widget.title,
        actions: <Widget>[
          IconButton(
            icon: Text(_searchShow ? '搜索' : '筛选', style: IText.style2(28)),
            onPressed: () => setState(() {
              _searchShow = !_searchShow;
              if (!_searchShow) widget.loadingController.callRefresh();
            }),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          widget.childItem,
          _searchShow
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: GestureDetector(
                    // onTap: () => setState(() => _searchShow = false),
                    child: Container(
                      width: LqrUntils.screenWidth,
                      height: LqrUntils.screenHeight,
                      color: Colors.black12,
                      child: UnconstrainedBox(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: LqrUntils.screenWidth,
                          padding: LqrEdge.all(),
                          decoration: BoxDecoration(boxShadow: LqrShadow.boxShadow, color: Colors.white),
                          child: Column(
                            children: <Widget>[
                              widget.searchWidget,
                              Container(height: Lqr.ui.width(30)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IButton(
                                    title: "取消",
                                    size: IButtonSize.small,
                                    plain: true,
                                    onTap: () {
                                      setState(() {
                                        _searchShow = !_searchShow;
                                      });
                                    },
                                  ),
                                  Container(width: Lqr.ui.width(30)),
                                  widget.reset == null
                                      ? Container()
                                      : IButton(
                                          title: "重置",
                                          size: IButtonSize.small,
                                          type: IButtonType.danger,
                                          onTap: widget.reset,
                                        ),
                                  Container(width: Lqr.ui.width(30)),
                                  IButton(
                                    title: "搜索",
                                    size: IButtonSize.small,
                                    onTap: () {
                                      setState(() {
                                        _searchShow = !_searchShow;
                                      });
                                      widget.loadingController.callRefresh();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
