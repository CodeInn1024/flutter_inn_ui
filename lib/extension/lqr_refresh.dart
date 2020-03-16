/*
 * @Description: 上拉加载下拉刷新
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-13 11:03:19
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrRefresh extends StatefulWidget {
  /// [数据内容]
  final Widget child;

  /// [空数据视图]
  final Widget noDataWidget;

  /// [数据]
  final List list;

  /// [下拉刷新事件]
  final Future Function(EasyRefreshController controller) onRefresh;

  /// [上拉加载事件]
  final Future Function(EasyRefreshController controller) loadMore;

  /// [是否开启控制结束刷新]
  final bool enableControlFinishRefresh;

  /// [是否开启控制结束加载]
  final bool enableControlFinishLoad;

  /// [首次刷新]
  final bool firstRefresh;

  /// [控制器]
  final EasyRefreshController loadingController;

  /// [顶部回弹]
  final bool topBouncing;

  /// [空视图]
  final Widget emptyWidget;

  /// [Slivers集合]
  final List<Widget> slivers;

  /// [主题]
  final LqrRefreshTheme theme;

  /// [首次刷新视图]
  final Widget firstRefreshWidget;

  LqrRefresh({
    Key key,
    this.child,
    this.noDataWidget,
    this.list = const [],
    this.onRefresh,
    this.loadMore,
    this.enableControlFinishRefresh = false,
    this.enableControlFinishLoad = false,
    this.loadingController,
    this.firstRefresh = true,
    this.topBouncing = true,
    this.emptyWidget,
    this.slivers,
    this.theme,
    this.firstRefreshWidget,
  }) : super(key: key);
  @override
  _LqrRefreshState createState() => _LqrRefreshState();
}

class _LqrRefreshState extends State<LqrRefresh> {
  int _loadIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      enableControlFinishRefresh: widget.enableControlFinishRefresh,
      enableControlFinishLoad: widget.enableControlFinishLoad,
      taskIndependence: false,
      controller: widget.loadingController,
      firstRefresh: widget.firstRefresh,
      topBouncing: widget.topBouncing,
      firstRefreshWidget: widget.firstRefreshWidget,
      emptyWidget: _loadIndex == 0 && widget.list.length == 0 ? widget.emptyWidget : null,
      header: ClassicalHeader(
        refreshText: "下拉刷新",
        refreshReadyText: '释放刷新',
        refreshingText: '刷新中...',
        refreshedText: "刷新完成",
        refreshFailedText: "刷新失败",
        noMoreText: "没有更多数据",
        infoText: "上次更新 %T",
      ),
      footer: ClassicalFooter(
        loadText: "上拉加载更多",
        loadReadyText: "释放加载",
        loadingText: "加载中...",
        loadedText: "加载完成",
        loadFailedText: "加载失败",
        noMoreText: "没有更多数据",
        infoText: "上次加载 %T",
      ),
      slivers: widget.slivers ?? childSlivers,
      onRefresh: widget.onRefresh == null
          ? null
          : () async {
              _loadIndex++;
              await widget.onRefresh(widget.loadingController);
            },
      onLoad: widget.loadMore == null
          ? null
          : () async {
              _loadIndex++;
              await widget.loadMore(widget.loadingController);
            },
    );
  }

  List<Widget> get childSlivers => <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _loadIndex > 0 && widget.list.length == 0 ? widget.noDataWidget ?? Container() : widget.child,
            ],
          ),
        ),
      ];
}

class LqrRefreshTheme {
  LqrRefreshTheme ui = new LqrRefreshTheme();

  /// [头部]
  Header header;

  /// [底部]
  Footer footer;

  LqrRefreshTheme({header, footer})
      : header = header ??
            ClassicalHeader(
              refreshText: "下拉刷新",
              refreshReadyText: '释放刷新',
              refreshingText: '刷新中...',
              refreshedText: "刷新完成",
              refreshFailedText: "刷新失败",
              noMoreText: "没有更多数据",
              infoText: "上次更新 %T",
              textColor: Lqr.ui.primaryColor,
            ),
        footer = footer ??
            ClassicalFooter(
              loadText: "上拉加载更多",
              loadReadyText: "释放加载",
              loadingText: "加载中...",
              loadedText: "加载完成",
              loadFailedText: "加载失败",
              noMoreText: "没有更多数据",
              infoText: "上次加载 %T",
              textColor: Lqr.ui.primaryColor,
            );
}
