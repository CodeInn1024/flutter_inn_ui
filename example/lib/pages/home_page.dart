/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 16:15:00
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-11 15:41:11
*/

import 'package:lqrui/common/common.dart';
import 'package:lqrui/pages/style/style.dart';
import 'package:lqrui/pages/basics/basics.dart';
import 'package:lqrui/pages/about/about.dart';
import 'package:lqrui/pages/extension/extension.dart';

List homePages = [
  {
    "widget": BottomNavigationBarItem(
      icon: Icon(Icons.style),
      title: Text('样式'),
    ),
    "content": Style(),
  },
  {
    "widget": BottomNavigationBarItem(
      icon: Icon(Icons.border_all),
      title: Text('基础'),
    ),
    "content": Basics(),
  },
  {
    "widget": BottomNavigationBarItem(
      icon: Icon(Icons.verified_user),
      title: Text('扩展'),
    ),
    "content": Extension(),
  },
  {
    "widget": BottomNavigationBarItem(
      icon: Icon(Icons.verified_user),
      title: Text('关于'),
    ),
    "content": About(),
  },
];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Store.connect<IndexStore>(
      builder: (context, IndexStore _store, child) {
        return Scaffold(
          body: IndexedStack(
            index: _store.homeTabIndex,
            children: homePages.map<Widget>((item) => item['content']).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _store.homeTabIndex,
            fixedColor: Theme.of(context).primaryColor,
            onTap: (int index) => _store.sethomeTabIndex(index),
            type: BottomNavigationBarType.fixed,
            items: homePages.map<BottomNavigationBarItem>((item) => item['widget']).toList(),
          ),
        );
      },
    );
  }
}
