/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-10 14:39:43
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 17:01:47
*/

import 'package:flutter_lqrui/lqr_common.dart';

TextEditingController _controller = TextEditingController();

void checkApi(Map<String, LqrApiConfig> apiConfig, Function(String url) onTap) {
  showModalBottomSheet(
    context: Lqr.ui.scaffoldCtx,
    shape: RoundedRectangleBorder(borderRadius: IRadius.top()),
    isScrollControlled: true,
    builder: (BuildContext context) {
      double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      List<LqrApiConfig> _api = apiConfig.values.toList();
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < _api.length; i++) ListTile(title: Text(_api[i].name), onTap: () => onTap(_api[i].url)),
            Container(
              padding: LqrEdge.all(),
              child: Row(
                children: <Widget>[
                  Expanded(child: LqrInput(controller: _controller, theme: LqrInputType.dark)),
                  Container(width: Lqr.ui.width(20)),
                  IButton(title: '确定', size: IButtonSize.small, onTap: () => onTap(_controller.text)),
                ],
              ),
            ),
            Container(
              height: keyboardHeight,
            ),
          ],
        ),
      );
    },
  );
}

class LqrApiConfig {
  final String name;
  final String url;
  const LqrApiConfig({this.name, this.url});
}
