/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 11:17:17
*/

import 'package:flutter_lqrui/lqr_common.dart';

class ISelectLists extends StatefulWidget {
  /// [数据]
  final List<LqrTreeListsModel> lists;

  /// [视图]
  final Widget Function(LqrTreeListsModel data, bool isSelect) content;

  /// [过滤]
  final bool Function(LqrTreeListsModel data) filter;

  /// [是否可多选]
  final bool isMultiple;

  /// [选中的数据]
  final ISelectData selectData;

  /// [改变事件]
  final Function(ISelectData) onChanged;

  const ISelectLists({
    Key key,
    this.lists,
    this.content,
    this.filter,
    this.isMultiple = false,
    this.selectData,
    this.onChanged,
  }) : super(key: key);
  @override
  _ISelectListsState createState() => _ISelectListsState();
}

class _ISelectListsState extends State<ISelectLists> {
  Map<String, LqrTreeListsModel> _checkedDatas = {};

  @override
  void initState() {
    super.initState();
    if (widget.selectData?.checkedDatas != null) {
      _checkedDatas = widget.selectData.checkedDatas.map((String key, LqrTreeListsModel value) {
        return MapEntry(key, value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.lists.map((LqrTreeListsModel v) => widget.filter != null && !widget.filter(v) ? Container() : page(v)).toList(),
    );
  }

  Widget page(LqrTreeListsModel data) {
    bool isSelect = _checkedDatas.containsKey(data.value);
    print(_checkedDatas.length);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!widget.isMultiple) _checkedDatas.clear();
          isSelect && widget.isMultiple ? _checkedDatas.remove(data.value) : _checkedDatas[data.value] = data;
        });
        if (widget.onChanged != null) {
          ISelectData a = ISelectData();
          a.checkedDatas = _checkedDatas;
          a.checkedValue = _checkedDatas.keys.toList();
          a.checkedLists = _checkedDatas.values.toList();
          widget.onChanged(a);
        }
      },
      child: widget.content == null
          ? LqrCard(
              margin: LqrEdge.bottom(),
              content: Row(
                children: <Widget>[
                  IIcon(isSelect ? IIcons.radioOn : IIcons.radioOff),
                  Container(width: Lqr.ui.width(Lqr().edgeInsets)),
                  Expanded(child: Text(data.name)),
                ],
              ),
            )
          : widget.content(data, isSelect),
    );
  }
}

class ISelectData {
  /// [选中的value]
  List<String> checkedValue = [];

  /// [内部数据]
  Map<String, LqrTreeListsModel> checkedDatas = {};

  /// 不能设置为空数组
  List<LqrTreeListsModel> checkedLists;
}
