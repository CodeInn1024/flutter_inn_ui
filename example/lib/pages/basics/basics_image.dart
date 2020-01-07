/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-06 15:22:51
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:56:20
*/

import 'package:lqrui/common/common.dart';

class BasicsImage extends StatelessWidget {
  BasicsImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LqrAppBar(title: "图片缓存"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            basics,
            preview,
          ],
        ),
      ),
    );
  }

  /// [图片缓存]
  get basics => Column(
        children: <Widget>[
          LqrCell(title: "图片缓存", left: LqrCellWidget.origin),
          Container(
            padding: LqrEdge.edgeH(lr: 20, tb: 50),
            child: Wrap(
              spacing: Lqr.ui.width(50),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: Lqr.ui.width(200),
                      height: Lqr.ui.width(200),
                      margin: LqrEdge.edgeB(),
                      color: Colors.white,
                      child: LqrImageLoading(),
                    ),
                    Text('图片加载样式', style: TextStyle(color: LqrText.color2)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: Lqr.ui.width(200),
                      height: Lqr.ui.width(200),
                      margin: LqrEdge.edgeB(),
                      color: Colors.white,
                      child: LqrImageError(),
                    ),
                    Text('图片失败样式', style: TextStyle(color: LqrText.color2)),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  /// [图片预览]
  final List<String> previewList = [
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
    "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
  ];

  get preview => Column(
        children: <Widget>[
          LqrCell(title: "图片预览", left: LqrCellWidget.origin),
          GridView.builder(
            padding: LqrEdge.edgeA(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: Lqr.ui.width(LqrEdge.ui.size),
              crossAxisSpacing: Lqr.ui.width(LqrEdge.ui.size),
              childAspectRatio: 1.4, //框的比列
            ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int i) {
              return LqrImage(
                src: "https://img3.mukewang.com/szimg/5dc9047a09bae31e12000676-360-202.png",
                width: 100,
                height: 100,
                // onTap: () => InnRouter.push(InnRouterClass(LqrImagePreview(index: i, list: previewList))),
              );
            },
          ),
        ],
      );
}
