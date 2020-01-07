/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-07 15:38:03
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-07 18:22:06
*/

import 'package:lqrui/common/common.dart';

class BasicsInput extends StatefulWidget {
  BasicsInput({Key key}) : super(key: key);

  @override
  _BasicsInputState createState() => _BasicsInputState();
}

class _BasicsInputState extends State<BasicsInput> {
  TextEditingController _unameController = TextEditingController(text: "12");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "输入框"),
      body: Container(
        child: IInput(
          controller: _unameController,
          // maxLength: 10,
          mustIcon: true,
          title: "测试测试测试",
        ),
      ),
    );
  }
}
