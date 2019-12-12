import 'package:flutter_lqrui/lqr_common.dart';

class LqrTree extends StatefulWidget {
  /// [数据]
  final List<LqrTreeListsModel> lists;

  /// [过滤]
  final bool Function(LqrTreeListsModel, String) filter;

  /// [是否可多选]
  final bool isMultiple;

  /// [是否展开所有节点]
  final bool expandAll;

  /// [回显的id，选中的value数组]
  final List<String> checkedValue;

  /// [显示最大层数]
  final int level;

  /// [选项分隔符]
  final String separator;

  final String searchHintText; // 搜索提示
  final int checkIndex; // 层级选择

  const LqrTree({
    Key key,
    this.lists,
    this.filter,
    this.isMultiple = false,
    this.expandAll = false,
    this.level = 10,
    this.checkedValue,
    this.searchHintText = "输入关键字搜索",
    this.checkIndex,
    this.separator = ' / ',
  }) : super(key: key);

  @override
  _LqrTreeState createState() => _LqrTreeState();
}

class _LqrTreeState extends State<LqrTree> {
  String _searchVal = '';
  List<LqrTreeListsModel> _lists = [];
  Map<int, LqrTreeListsModel> _checkedDatas = {};
  int _key = 0;

  @override
  void initState() {
    super.initState();
    _lists = LqrTreeModel.fromJson(LqrTreeModel(lists: widget.lists).toJson()).lists;
    traversal(_lists, 1, []);
  }

  void traversal(List<LqrTreeListsModel> obj, int level, List<TreeParent> parent) {
    for (LqrTreeListsModel item in obj) {
      /// [是否全部展开]
      if (widget.expandAll) item.isShow = true;

      /// [反选]
      List<LqrTreeListsModel> aList = [...item.lists, item];
      aList.forEach((v) {
        _key++;
        v.key = _key;

        /// [添加父元素]
        v.parent = [...parent, TreeParent(name: v.name, value: v.value)];
        if (level == widget.checkIndex) v.enabled = true;
        if (widget.checkedValue.indexOf(v.value) != -1) {
          v.isSelect = true;
          widget.isMultiple ? _checkedDatas[_key] = v : _checkedDatas[0] = v;
        }
      });

      /// [最大层级处理]
      if (level >= widget.level) {
        item.children = [];
        continue;
      }

      /// [遍历下级]
      if (item.children.length > 0) {
        traversal(item.children, level + 1, item.parent);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(
        title: '转派',
        actions: <Widget>[
          LqrButton(title: '确认', onTap: confirm, size: LqrButtonSize.mini, margin: LqrEdge.edgeH(size: 20)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Lqr().width(100),
            padding: LqrEdge.edgeA(),
            decoration: BoxDecoration(color: Colors.white),
            margin: LqrEdge.edgeB(),
            child: LqrSearch(
              hintText: widget.searchHintText,
              onChanged: (val) => setState(() => _searchVal = val),
            ),
          ),
          Expanded(
            child: Container(
              width: LqrUntils.screenWidth,
              padding: LqrEdge.edgeA(),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _lists.map((LqrTreeListsModel v) => page(v)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget page(LqrTreeListsModel data) {
    return Column(
      children: <Widget>[
        data.children.length > 0 || filter(data, _searchVal)
            ? Container(
                height: Lqr().width(60),
                child: GestureDetector(
                  onTap: () => onTap(data, data.children.length == 0),
                  child: Row(
                    children: <Widget>[
                      LqrIcon(icon: data.children.length == 0 ? LqrIconType.userSolid : LqrIconType.folderSolid, size: 30),
                      Container(width: Lqr().width(30)),
                      Expanded(child: Container(child: Text(data.name, style: TextStyle(fontSize: Lqr.ui.size(28))))),
                      Container(width: Lqr().width(20)),
                      statusType(data),
                    ],
                  ),
                ),
              )
            : Container(),
        data.isShow && data.children.length > 0
            ? Container(
                padding: LqrEdge.edgeL(size: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: data.children.map((LqrTreeListsModel v) => page(v)).toList(),
                ),
              )
            : Container(),
        ...data.lists.map((LqrTreeListsModel v) => page(v)),
      ],
    );
  }

  /// [显示类型]
  Widget statusType(LqrTreeListsModel data) {
    List<Widget> lists = [];
    if (data.children.length == 0 || data.enabled) {
      IconData icon = widget.isMultiple && data.isSelect || _checkedDatas.length > 0 && data.value == _checkedDatas[0].value ? LqrIconType.radioOn : LqrIconType.radioOff;
      lists.add(GestureDetector(
        onTap: () => onTap(data, true),
        child: LqrIcon(icon: icon, size: 25),
      ));
    }
    if (data.children.length > 0) {
      IconData icon = data.isShow ? LqrIconType.arrowUp : LqrIconType.arrowDown;
      lists.add(LqrIcon(icon: icon, size: 25));
    }
    return Container(
      width: Lqr().width(60),
      child: Row(children: lists, mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }

  /// [过滤]
  bool filter(LqrTreeListsModel data, val) {
    if (widget.filter == null)
      return data.name.contains(val);
    else
      return widget.filter(data, val);
  }

  /// [点击]
  void onTap(LqrTreeListsModel data, type) {
    setState(() {
      switch (type) {
        case true:
          if (widget.isMultiple) {
            data.isSelect = !data.isSelect;
            data.isSelect ? _checkedDatas[data.key] = data : _checkedDatas.remove(data.key);
          } else {
            _checkedDatas = {};
            _checkedDatas[0] = data;
          }
          break;
        case false:
          data.isShow = !data.isShow;
          break;
      }
    });
  }

  /// [回调]
  void confirm() {
    LqrTreeCalckback _a = LqrTreeCalckback();
    _a.checkedMap = _checkedDatas;
    _a.checkedLists = _checkedDatas.values.toList();
    _a.value = _checkedDatas.values.map((v) => v.value).toList();
    _a.name = _a.checkedLists.map((v) => v.name).join(widget.separator);
    _a.parent = _a.checkedLists.map((v) => v.parent).toList();
    _a.allLevelsName = _a.parent.map((v) => v.map((e) => e.name).join(widget.separator)).toList();
    _a.allLevelsValue = _a.parent.map((v) => v.map((e) => e.value).toList()).toList();
    print(_a.allLevelsName);
    Navigator.pop(context, _a);
  }
}
