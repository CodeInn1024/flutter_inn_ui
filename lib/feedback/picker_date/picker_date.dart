import 'package:flutter_lqrui/lqr_common.dart';

class PickerDateClass {
  static const int kMDY = 0;
  static const int kHM = 1;
  static const int kHMS = 2;
  static const int kHM_AP = 3;
  static const int kMDYHM = 4;
  static const int kMDYHM_AP = 5;
  static const int kMDYHMS = 6;
  static const int kYMD = 7;
  static const int kYMDHM = 8;
  static const int kYMDHMS = 9;
  static const int kYMD_AP_HM = 10;
  static const int kYM = 11;
  static const int kDMY = 12;
}

pickerDate({
  int type = PickerDateClass.kYMD,
  int maxMs = 0,
  int minMs,
  int valMs,
  Function(int val) callBack,
}) {
  Picker(
    hideHeader: true,
    adapter: DateTimePickerAdapter(
      type: type,
      maxValue: timeMs(maxMs),
      minValue: timeMs(minMs),
      isNumberMonth: true,
      value: timeMs(valMs),
    ),
    title: Text("选择时间"),
    onConfirm: (Picker picker, List value) {
      int timeDateMs = DateUtil.getDateMsByTimeStr((picker.adapter as DateTimePickerAdapter).value.toString());
      callBack(timeDateMs);
    },
  ).showDialog(Lqr.ui.scaffoldCtx);
}

DateTime timeMs(int ms) {
  return ms == 0
      ? null
      : DateTime.fromMicrosecondsSinceEpoch(
          ms == null ? DateUtil.getNowDateMs() * 1000 : ms * 1000,
        );
}
