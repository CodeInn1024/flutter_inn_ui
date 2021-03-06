/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:02:42
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-20 16:24:15
*/

class LqrTreeModel<T> {
  List<LqrTreeListsModel> lists = [];

  LqrTreeModel({this.lists});

  LqrTreeModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<LqrTreeListsModel>();
      json['lists'].forEach((v) {
        lists.add(new LqrTreeListsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LqrTreeListsModel {
  /// [名字]
  String name;

  /// [内容]
  String value;

  /// [是否可选]
  bool enabled;

  /// [是否选中]
  bool isSelect;

  /// [是否展开]
  bool isUnfold;

  /// [信息]
  Map<String, dynamic> info;

  /// [key]
  int key;

  /// [子元素]
  List<LqrTreeListsModel> children;

  /// [同级选择元素]
  List<LqrTreeListsModel> lists = [];

  /// [父元素]
  List<TreeParent> parent = [];

  LqrTreeListsModel({
    this.name = '',
    this.value = '',
    this.children,
    this.enabled,
    this.isUnfold,
    this.info,
    this.key,
    this.lists,
    this.parent,
    this.isSelect,
  });

  LqrTreeListsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    enabled = json['enabled'] != null ? json['enabled'] : false;
    isSelect = json['isSelect'] != null ? json['isSelect'] : false;
    isUnfold = json['isUnfold'] != null ? json['isUnfold'] : false;
    info = json['info'] != null ? json['info'] : {};
    key = json['key'] != null ? json['key'] : 0;
    if (json['children'] != null) {
      children = new List<LqrTreeListsModel>();
      json['children'].forEach((v) {
        children.add(new LqrTreeListsModel.fromJson(v));
      });
    }
    if (json['lists'] != null) {
      lists = new List<LqrTreeListsModel>();
      json['lists'].forEach((v) {
        lists.add(new LqrTreeListsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['enabled'] = this.enabled;
    data['isSelect'] = this.isSelect;
    data['isShow'] = this.isUnfold;
    data['info'] = this.info;
    data['key'] = this.key;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// [父级数据]
class TreeParent {
  String name;
  String value;
  TreeParent({this.name, this.value});
}
