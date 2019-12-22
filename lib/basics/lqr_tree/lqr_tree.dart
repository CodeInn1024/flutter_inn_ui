import 'package:flutter_lqrui/lqr_common.dart';

class LqrTree extends StatefulWidget {
  /// [数据]
  final List<LqrTreeListsModel> lists;

  /// [过滤]
  final bool Function(LqrTreeListsModel) filter;

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

  /// [层级选择]
  final int checkIndex;

  /// [改变事件]
  final Function(LqrTreeCalckback data) onChanged;

  final List test;

  const LqrTree({
    Key key,
    @required this.lists,
    this.filter,
    this.isMultiple = false,
    this.expandAll = false,
    int level = 10,
    this.checkedValue = const [],
    this.checkIndex,
    this.separator = ' / ',
    this.onChanged,
    this.test,
  })  : level = level ?? 10,
        super(key: key);

  @override
  _LqrTreeState createState() => _LqrTreeState();
}

class _LqrTreeState extends State<LqrTree> {
  List<LqrTreeListsModel> _lists = [];
  Map<int, LqrTreeListsModel> _checkedDatas = {};
  int _key = 0;

  @override
  void initState() {
    super.initState();
    _lists = traversal(widget.test, 1, []);
  }

  List<LqrTreeListsModel> traversal(List obj, int level, List<TreeParent> parent) {
    List<LqrTreeListsModel> _a = [];
    for (Map json in obj) {
      LqrTreeListsModel item = LqrTreeListsModel(
        name: json['name'],
        value: json['value'],
        enabled: json['enabled'] != null ? json['enabled'] : false,
        isSelect: json['isSelect'] ?? widget.expandAll,
        isUnfold: json['isUnfold'] != null ? json['isUnfold'] : false,
        info: json['info'] != null ? json['info'] : {},
        key: json['key'] != null ? json['key'] : 0,
        lists: [],
      );

      if (json['lists'] != null) {
        item.lists = new List<LqrTreeListsModel>();
        json['lists'].forEach((v) {
          item.lists.add(new LqrTreeListsModel.fromJson(v));
        });
      }

      /// [反选]
      List<LqrTreeListsModel> aList = [...item.lists, item];
      aList.forEach((v) {
        _key++;
        v.key = _key;

        /// [添加父元素]
        v.parent = [...parent, TreeParent(name: v.name, value: v.value)];
        if (level == widget.checkIndex) v.enabled = true;
        if (widget.checkedValue != null && widget.checkedValue.indexOf(v.value) != -1) {
          v.isSelect = true;
          widget.isMultiple ? _checkedDatas[_key] = v : _checkedDatas[0] = v;
        }
      });

      /// [最大层级处理]
      if (level >= widget.level) {
        item.children = null;
      }

      /// [遍历下级]
      if (json['children'] != null) {
        item.children = traversal(json['children'], level + 1, item.parent);
      }

      // if (item.children == null && !widget.filter(item)) continue;

      _a.add(item);
    }
    return _a;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: _lists.map((LqrTreeListsModel v) => page(v)).toList(),
      ),
    );
  }

  Widget page(LqrTreeListsModel data) {
    return Column(
      children: <Widget>[
        // 子级选择
        data.children == null && (widget.filter == null || widget.filter(data))
            ? Container(
                height: Lqr().width(70),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(data, data.children == null),
                  child: Row(
                    children: <Widget>[
                      LqrIcon(icon: data.children == null ? LqrIconType.userSolid : LqrIconType.folderSolid, size: 30),
                      Container(width: Lqr().width(30)),
                      Expanded(child: Container(child: Text(data.name, style: TextStyle(fontSize: Lqr.ui.size(28))))),
                      Container(width: Lqr().width(20)),
                      statusType(data),
                    ],
                  ),
                ),
              )
            : Container(),
        // 父级
        data.children != null && data.children.length > 0
            ? Container(
                height: Lqr().width(70),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(data, data.children == null),
                  child: Row(
                    children: <Widget>[
                      LqrIcon(icon: data.children == null ? LqrIconType.userSolid : LqrIconType.folderSolid, size: 30),
                      Container(width: Lqr().width(30)),
                      Expanded(child: Container(child: Text(data.name, style: TextStyle(fontSize: Lqr.ui.size(28))))),
                      Container(width: Lqr().width(20)),
                      statusType(data),
                    ],
                  ),
                ),
              )
            : Container(),

        // 子级显示
        data.isUnfold && data.children != null
            ? Container(
                padding: LqrEdge.edgeL(size: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: data.children.map((LqrTreeListsModel v) => page(v)).toList(),
                ),
              )
            : Container(),
        //同级显示
        ...data.lists.map((LqrTreeListsModel v) => page(v)),
      ],
    );
  }

  /// [显示类型]
  Widget statusType(LqrTreeListsModel data) {
    List<Widget> lists = [];
    if (data.children == null || data.enabled) {
      IconData icon = widget.isMultiple && data.isSelect || _checkedDatas.length > 0 && data.value == _checkedDatas[0].value ? LqrIconType.radioOn : LqrIconType.radioOff;
      lists.add(GestureDetector(
        onTap: () => onTap(data, true),
        child: LqrIcon(icon: icon, size: 30),
      ));
    }
    if (data.children != null) {
      IconData icon = data.isUnfold ? LqrIconType.arrowUp : LqrIconType.arrowDown;
      lists.add(LqrIcon(icon: icon, size: 30));
    }
    return Container(
      width: Lqr().width(90),
      child: Row(children: lists, mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }

  /// [过滤]
  // bool filter(LqrTreeListsModel data) {
  //   if (widget.filter == null)
  //     return true;
  //   else
  //     return widget.filter(data);
  // }

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
          _onChanged();
          break;
        case false:
          data.isUnfold = !data.isUnfold;
          break;
      }
    });
  }

  /// [回调]
  void _onChanged() {
    LqrTreeCalckback _a = LqrTreeCalckback();
    _a.checkedMap = _checkedDatas;
    _a.checkedLists = _checkedDatas.values.toList();
    _a.value = _checkedDatas.values.map((v) => v.value).toList();
    _a.name = _a.checkedLists.map((v) => v.name).join(widget.separator);
    _a.parent = _a.checkedLists.map((v) => v.parent).toList();
    _a.allLevelsName = _a.parent.map((v) => v.map((e) => e.name).join(widget.separator)).toList();
    _a.allLevelsValue = _a.parent.map((v) => v.map((e) => e.value).toList()).toList();
    print(_a.allLevelsName);
    widget.onChanged(_checkedDatas.isEmpty ? null : _a);
  }
}
