/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:09:23
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-04 16:53:00
*/
import '../../common/common.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "登录"),
      body: Center(
        child: LqrButton(
          title: "登录",
          onTap: () => Store.value<IndexStore>(context).setToken("token"),
        ),
      ),
    );
  }
}
