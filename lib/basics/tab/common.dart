export './tab.dart';

class ITabModel {
  List<ITabData> lists;

  ITabModel(this.lists);

  ITabModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<ITabData>();
      json['lists'].forEach((v) {
        lists.add(new ITabData.fromJson(v));
      });
    }
  }
}

class ITabData {
  String name;
  int value;

  ITabData(this.name, this.value);

  ITabData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }
}
