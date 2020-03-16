/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:02:42
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-20 16:24:15
*/

class ISelectModel<T> {
  List<ISelectDataModel> lists = [];

  ISelectModel({this.lists});

  ISelectModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<ISelectDataModel>();
      json['lists'].forEach((v) {
        lists.add(new ISelectDataModel.fromJson(v));
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

class ISelectDataModel {
  /// [名字]
  String name;

  /// [内容]
  String value;

  /// [是否可选]
  bool enabled;

  /// [是否选中]
  bool isSelect;

  /// [信息]
  Map<String, dynamic> info;

  /// [key]
  int key;

  ISelectDataModel({
    this.name = '',
    this.value = '',
    this.enabled,
    this.info,
    this.key,
    this.isSelect,
  });

  ISelectDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    enabled = json['enabled'] != null ? json['enabled'] : false;
    isSelect = json['isSelect'] != null ? json['isSelect'] : false;
    info = json['info'] != null ? json['info'] : {};
    key = json['key'] != null ? json['key'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['enabled'] = this.enabled;
    data['isSelect'] = this.isSelect;
    data['info'] = this.info;
    data['key'] = this.key;
    return data;
  }
}
