/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-06 09:04:10
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-16 18:04:24
*/
import 'package:flutter_lqrui/flutter_lqrui.dart';

// Map ruleMap = {
//   'string': (val) => !(val == null || val.isEmpty),
//   'int': (val) => !(val is int && val != null),
//   'timestamp13': (val) => !(val == null || val.toString().length != 13),
//   'phone': (val) => LqrValidator.matches(LqrValidator.isPhone, val),
//   'list': (val) => !(val == null || val.isEmpty),
//   'dateRange': (val) => !(val == null || val.isEmpty || val.length != 2 || val[0].toString().length != 13 || val[1].toString().length != 13),
//   'idCard': (val) => LqrValidator.matches(LqrValidator.isIdCard, val),
//   'email': (val) => LqrValidator.matches(LqrValidator.isEmail, val),
//   'postCode': (val) => LqrValidator.matches(LqrValidator.isPostCode, val),
//   'url': (val) => LqrValidator.matches(LqrValidator.isURL, val),
//   'null': (val) => !(val == null),
//   // "passworld": (val) => LqrValidator.matches(LqrValidator.isPassworld, val),
//   "passworld": (val) => val.length == 8,
// };

class IValidator {
  // 手机号码
  static final String isPhone = "^(0|86|17951)?(13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}\$";
  // 身份证
  static final String isIdCard = "^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])\$)\$";
  // 邮箱
  static final String isEmail = "^([a-zA-Z]|[0-9])(\\w|\\-)+@[a-zA-Z0-9]+\\.([a-zA-Z]{2,4})\$";
  // 路径
  static final String isURL = "^https?:\\/\\/(([a-zA-Z0-9_-])+(\\.)?)*(:\\d+)?(\\/((\\.)?(\\?)?=?&?[a-zA-Z0-9_-](\\?)?)*)*\$";
  // 路径
  static final String isPostCode = "^[1-9]\\d{5}(?!\\d)\$";
  // 密码
  static final String isPassworld = "^[0-9a-zA-Z]{6,15}\$";

  // 对象验证
  static Future verify(Map<String, IValidatorData> rule, Map<String, dynamic> value, [bool dialog = true]) async {
    List<IValidatorMsg> res = [];
    rule.forEach((k, v) {
      if (!value.containsKey(k)) throw ("缺少$k");
      var _val = value[k] ?? "";
      if (v.minLength != null && _val.length < v.minLength || v.maxLength != null && _val.length > v.maxLength || v.validator != null && !v.validator(_val)) {
        res.add(IValidatorMsg(message: v.message, key: k));
      }
    });
    if (res.length > 0 && dialog) {
      LqrToast.toast(res.first.message);
      throw res.first.message;
    }
    return res;
  }

  // 正则
  static bool matches(String regex, String input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }
}

class IValidatorType {
  static bool string(val) => !(val == null || val.isEmpty);
  static bool phone(val) => IValidator.matches(IRegular.phone, val);
}

class IValidatorData {
  final String message;
  final bool Function(dynamic) validator;
  final int minLength;
  final int maxLength;
  IValidatorData({this.message, this.validator, this.minLength, this.maxLength});
}

class IValidatorMsg {
  final String type;
  final String message;
  final String key;
  IValidatorMsg({this.type, this.message, this.key});
}
