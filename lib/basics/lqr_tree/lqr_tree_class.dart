/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-10 17:07:32
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 09:44:33
*/

import 'package:flutter_lqrui/lqr_common.dart';

/// [回调数据]
class LqrTreeCalckback {
  /// [名字]
  String name;

  /// [选中的value]
  List<String> value;

  /// [选中的内部data]
  Map<int, LqrTreeListsModel> checkedMap;

  /// [选中的data]
  List<LqrTreeListsModel> checkedLists;

  /// [选中的父元素]
  List<List<TreeParent>> parent;

  /// [完整路径name]
  List<String> allLevelsName;

  /// [完整路径value]
  List<List<String>> allLevelsValue;

  LqrTreeCalckback({
    this.name = '',
    this.checkedLists = const [],
    this.checkedMap = const {},
    this.value = const [],
    this.parent = const [],
    this.allLevelsName = const [],
    this.allLevelsValue = const [],
  });
}
