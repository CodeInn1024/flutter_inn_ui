/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-18 17:47:13
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-19 11:27:38
*/

extension FancyList<T> on List<T> {
  /// [判断对象属性是否为空]
  bool hasEmpty(bool test(T element)) {
    if (this.isEmpty) return true;
    for (T element in this) if (test(element)) return true;
    return false;
  }

  /// [数组按数量分组]
  List<List<T>> groupToCount(int count) {
    List<List<T>> _a = [];
    for (var i = 0; i < (this.length / count).ceil(); i++) {
      int _start = i * count;
      int _end = (i + 1) * count;
      _end = _end > this.length ? (this.length - _start) + _start : _end;
      _a.add(this.getRange(_start, _end).toList());
    }
    return _a;
  }
}
