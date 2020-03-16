/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-20 15:44:28
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-20 16:43:17
*/
import 'package:flutter_lqrui/lqr_common.dart';

class FormInput {
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final String hintText;
  final Function onTap;
  final TextAlign textAlign;
  final bool isObscure;
  final bool enabled;

  FormInput({
    this.title,
    this.icon,
    TextEditingController controller,
    this.hintText = "",
    this.onTap,
    this.textAlign = TextAlign.start,
    this.isObscure,
    this.enabled,
  }) : controller = controller ?? TextEditingController();
}
