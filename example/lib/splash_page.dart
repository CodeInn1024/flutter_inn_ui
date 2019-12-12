/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 12:19:46
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-05 16:20:21
*/

import './common/common.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  LqrUntils.screenHeight,
      child: Image.asset("assets/images/splash_bg.png", fit: BoxFit.cover),
    );
  }

  void countDown() {
    Future.delayed(Duration(seconds: 1), goHomePage);
  }

  void goHomePage() async {
    Store.value<IndexStore>(context).checkSplash();
  }
}
