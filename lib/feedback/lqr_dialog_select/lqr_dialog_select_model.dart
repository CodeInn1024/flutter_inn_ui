/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 15:02:42
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-12 11:06:31
*/

class LqrDialogSelectModel {
  List<LqrDialogSelectListsModel> lists = [];

  LqrDialogSelectModel({this.lists});

  LqrDialogSelectModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<LqrDialogSelectListsModel>();
      json['lists'].forEach((v) {
        lists.add(new LqrDialogSelectListsModel.fromJson(v));
      });
    }
  }
}

class LqrDialogSelectListsModel<T> {
  String name;
  String value;
  T info;

  LqrDialogSelectListsModel({
    this.name = '',
    this.value = '',
    this.info,
  });

  LqrDialogSelectListsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }
}
