/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 16:20:55
*/
import 'package:flutter_lqrui/lqr_common.dart';

class TimeOut extends StatefulWidget {
  final params;
  TimeOut({Key key, this.params}) : super(key: key);
  @override
  _TimeOutState createState() => _TimeOutState();
}

class _TimeOutState extends State<TimeOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('超时')),
      body: Container(
        height:  LqrUntils.screenWidth - 80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                IconData(0xe62c, fontFamily: 'IconFont'),
                color: LqrText.color2,
                size: Lqr.ui.size(80),
              ),
              Text(
                '\n\n请求超时',
                style:
                    TextStyle(color: LqrText.color2, fontSize: Lqr.ui.size(18)),
              ),
              Text(
                '\n\n${widget.params['text'] ?? ''}',
                style: TextStyle(color: LqrText.color2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
