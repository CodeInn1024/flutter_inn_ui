/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-20 15:44:28
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-20 16:13:56
*/
import 'package:flutter_lqrui/lqr_common.dart';

class FormText {
  String title;
  IconData icon;
  String value;
  String valueName;
  String hintText;
  Function() onTap;

  FormText({
    this.title,
    this.icon,
    this.value,
    this.valueName = "",
    this.hintText = "",
    this.onTap,
  });
}
