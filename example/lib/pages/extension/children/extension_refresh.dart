/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:38:04
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 11:30:27
*/

import 'package:lqrui/common/common.dart';

class ExtensionRefresh extends StatefulWidget {
  ExtensionRefresh({Key key}) : super(key: key);

  @override
  _ExtensionRefreshState createState() => _ExtensionRefreshState();
}

class _ExtensionRefreshState extends State<ExtensionRefresh> {
  int page = 1;
  int count = 20;
  List<String> lists = [];
  EasyRefreshController loadingController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "下拉刷新上拉加载"),
      body: LqrRefresh(
        child: childItem,
        loadingController: loadingController,
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        list: lists,
        firstRefresh: true,
        noDataWidget: LqrNoData(),
        onRefresh: (v) async {
          page = 1;
          await loadingData();
        },
        loadMore: (v) async {
          page++;
          await loadingData();
        },
      ),
    );
  }

  Future loadingData() async {
    try {
      // var data = {'page': page, 'count': count};
      // var res = await lqrHttp(LqrApis.clientList, "POST", data: data);
      // ClientListModel a = ClientListModel.fromJson(res.data);
      if (page == 1) lists.clear();
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          // lists.addAll(a.clientLists);
          for (var i = 0; i < count; i++) {
            lists.add("测试");
          }
        });
      });
      loadingController.finishLoad(noMore: page >= 3, success: true);
    } catch (e) {
      LqrToast.toast(e);
    }
  }

  Widget get childItem => ListView.builder(
        padding: LqrEdge.edgeLR(),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: lists.length,
        itemBuilder: (BuildContext context, int i) {
          return LqrCell(
            margin: LqrEdge.edgeT(),
            title: '${lists[i]}：$i',
          );
        },
      );
}
