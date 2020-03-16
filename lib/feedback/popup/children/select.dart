import 'package:flutter_lqrui/lqr_common.dart';

class PopupSelect extends StatelessWidget {
  final String title;
  final List<ISelectDataModel> list;
  final Function(ISelectDataModel) onTap;
  const PopupSelect({
    Key key,
    this.title,
    this.list = const [],
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: IRadius.radius(),
        child: Container(
          width: LqrUntils.screenWidth - Lqr.ui.width(200),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              title == null
                  ? SizedBox()
                  : Padding(
                      padding: LqrEdge.tb(),
                      child: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: Lqr.ui.size(40))),
                    ),
              Container(
                constraints: BoxConstraints(maxHeight: LqrUntils.screenHeight - Lqr.ui.height(300)),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  padding: LqrEdge.bottom(),
                  itemBuilder: (BuildContext context, int i) {
                    ISelectDataModel _v = list[i];
                    return Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          if (onTap != null) onTap(_v);
                          IRouter.pop(_v);
                        },
                        child: Container(
                          padding: LqrEdge.lr(30),
                          alignment: Alignment.centerLeft,
                          height: Lqr.ui.width(80),
                          child: Text(_v.name, style: IText.style2(28)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
