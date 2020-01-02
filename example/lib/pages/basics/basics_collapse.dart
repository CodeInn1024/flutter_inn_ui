/*
 * @Description: 
 * @Version: 2.0
 * @Autor: hwd
 * @Date: 2019-12-10 14:49:27
 * @LastEditors: hwd
 * @LastEditTime: 2019-12-11 16:25:00
*/
import 'package:lqrui/common/common.dart';

class BasicsCollapse extends StatelessWidget {
  const BasicsCollapse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "折叠面板"),
      backgroundColor: Colors.white,
      body: Container(
        child: LqrCollapse(
          leftWidget: Container(
            margin: LqrEdge.edgeR(size: 20),
            child: LqrIcon(icon: LqrIconType.folderSolid,),
          ),
          title: '测试',
          childrenText: '上的开发了见识到了副驾驶劳动法l撒地方撒旦飞洒的撒旦发啊手动阀阿斯顿阀手动阀阿斯蒂芬撒旦ff',
          // children: Container(
          //   margin: LqrEdge.edgeTB(size: 10),
          //   child: Text('data'),
          // ),
        ),
      ),
    );
  }
}