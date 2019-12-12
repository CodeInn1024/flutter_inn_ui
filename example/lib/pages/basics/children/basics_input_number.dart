/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-09 10:00:00
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-10 15:50:14
*/

import 'package:lqrui/common/common.dart';

class BasicsInputNumber extends StatelessWidget {
  const BasicsInputNumber({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "计数器"),
      backgroundColor: Colors.white,
      body: Container(
        margin: LqrEdge.edgeA(size: 20),
        child: LqrInputNumber(
          onChange: (val) => print(val),
          max: '3',
          value: "4",
        ),
      ),
    );
  }
}
