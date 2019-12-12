/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 12:04:30
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrToast {
 static toast(text) => Fluttertoast.showToast(
        msg: '$text',
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: Lqr.ui.width(24),
        backgroundColor: LqrText.color3,
      );
}
