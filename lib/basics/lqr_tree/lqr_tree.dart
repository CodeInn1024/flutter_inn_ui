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

  /// [边距]
  final double padding;

  /// [线]
  final bool showLine;

  /// [高度]
  final double height;

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
    this.padding = 30,
    this.showLine = true,
    this.height = 80,
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
        _a.add(item);
        continue;
      }

      /// [遍历下级]
      if (json['children'] != null) {
        item.children = traversal(json['children'], level + 1, item.parent);
      }

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
        children: _lists.map((LqrTreeListsModel v) => page(v, 1)).toList(),
      ),
    );
  }

  Widget page(LqrTreeListsModel data, int level) {
    return Column(
      children: <Widget>[
        Container(
          height: Lqr().width(widget.height),
          padding: LqrEdge.left(widget.padding * level),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap(data, data.children == null),
            child: Row(
              children: <Widget>[
                IIcon(data.children == null ? IIcons.userSolid : IIcons.folderSolid, size: 30, color: level == 1 ? Lqr.ui.primaryColor : Lqr.ui.iconColor),
                Container(width: Lqr().width(30)),
                Expanded(child: Container(child: Text(data.name, style: TextStyle(fontSize: Lqr.ui.size(28))))),
                Container(width: Lqr().width(20)),
                statusType(data, level),
                Container(width: Lqr().width(widget.padding)),
              ],
            ),
          ),
        ),
        widget.showLine ? IBorder.divider(Colors.white) : Container(),
        // 子级显示
        data.isUnfold && data.children != null
            ? Container(
                color: Lqr.ui.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: data.children.map((LqrTreeListsModel v) => page(v, level + 1)).toList(),
                ),
              )
            : Container(),
        //同级显示
        ...data.lists.map((LqrTreeListsModel v) => page(v, level)),
      ],
    );
  }

  /// [显示类型]
  Widget statusType(LqrTreeListsModel data, int level) {
    List<Widget> lists = [];
    if (data.children == null || data.enabled) {
      bool _isSelect = widget.isMultiple && data.isSelect || _checkedDatas.length > 0 && data.value == _checkedDatas[0].value;
      IconData icon = _isSelect ? IIcons.radioOn : IIcons.radioOff;
      lists.add(GestureDetector(
        onTap: () => onTap(data, true),
        child: IIcon(icon, size: 30, color: _isSelect ? Lqr.ui.primaryColor : Lqr.ui.iconColor),
      ));
    }
    if (data.children != null) {
      lists.add(Container(width: Lqr().width(30)));
      IconData icon = data.isUnfold ? IIcons.arrowDown : IIcons.arrowRight;
      lists.add(IIcon(icon, size: 30));
    }
    return Row(children: lists, mainAxisAlignment: MainAxisAlignment.end);
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
