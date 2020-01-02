import 'package:flutter_lqrui/lqr_common.dart';
export './lqr_dialog_select_model.dart';

void lqrDialogSelect({
  List<LqrDialogSelectListsModel> list,
  Function(LqrDialogSelectListsModel data, int index) callback,
  String dialogTitle = "请选择",
}) {
  showDialog<Null>(
    context: Lqr.ui.scaffoldCtx,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(dialogTitle),
        children: [
          for (var i = 0; i < list.length; i++)
            SimpleDialogOption(
              child: Container(
                alignment: Alignment.centerLeft,
                height: Lqr.ui.width(40),
                child: Text(list[i].name, style: TextStyle(color: Colors.black87)),
              ),
              onPressed: () {
                if (callback != null) callback(list[i], i);
                Navigator.of(context).pop();
              },
            ),
        ],
      );
    },
  );
}
