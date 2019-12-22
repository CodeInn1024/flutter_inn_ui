import 'package:flutter_lqrui/lqr_common.dart';

class LqrPickerImage extends StatefulWidget {
  /// [最多选择数量]
  final int maxImages;

  /// [选择回调]
  final Function(List<MapEntry<String, MultipartFile>> addFiles, List<LqrPickerImageUrl> del) onChange;

  /// [上传的字段名]
  final String uploadKey;

  /// [回显的网络路径]
  final List<LqrPickerImageUrl> netFiles;

  /// [上传图片]
  final List<MapEntry<String, MultipartFile>> addFiles;

  /// [删除图片]
  final List<LqrPickerImageUrl> delFiles;

  /// [标题]
  final title;

  /// [提示内容]
  final hintText;

  LqrPickerImage({
    Key key,
    this.maxImages = 99,
    this.onChange,
    this.uploadKey = "add_files",
    this.netFiles = const [],
    this.title,
    this.hintText,
    this.addFiles = const [],
    this.delFiles = const [],
  }) : super(key: key);
  @override
  _LqrPickerImageState createState() => new _LqrPickerImageState();
}

class _LqrPickerImageState extends State<LqrPickerImage> {
  List<Asset> _assetImag = List<Asset>();
  List<Widget> _widget = [];
  List<LqrPickerImageUrl> _netFiles;

  @override
  void initState() {
    super.initState();
    _netFiles = [...widget.netFiles];
    update();
  }

  void update() {
    _widget = [
      for (var i = 0; i < _netFiles.length; i++)
        GestureDetector(
          onTap: pickImage,
          onLongPress: () => onLongPress("network", i),
          // child: Image.network(_netFiles[i].url, fit: BoxFit.cover),
          child: LqrImage(src: _netFiles[i].url, width: 300, height: 300),
        ),
      for (var i = 0; i < _assetImag.length; i++)
        GestureDetector(
          onTap: pickImage,
          onLongPress: () => onLongPress("asset", i),
          child: AssetThumb(asset: _assetImag[i], width: 300, height: 300),
        ),
    ];
    if (_widget.length < widget.maxImages) _widget = [GestureDetector(onTap: pickImage, child: Image.asset("assets/images/pickImage.png", fit: BoxFit.fill)), ..._widget];
    setState(() {
      _widget = _widget;
    });
  }

  Future onLongPress(String type, int index) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('是否删除此图片？'),
          actions: <Widget>[
            FlatButton(child: Text('取消'), onPressed: () => Navigator.of(context).pop()),
            FlatButton(
              child: Text('删除'),
              onPressed: () {
                if (type == "asset") {
                  _assetImag.removeAt(index);
                  widget.addFiles.removeAt(index);
                } else {
                  widget.delFiles.add(_netFiles[index]);
                  _netFiles.removeAt(index);
                }
                update();
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  //多图选择器
  Future pickImage() async {
    try {
      var requestList = await MultiImagePicker.pickImages(
        maxImages: widget.maxImages - widget.netFiles.length + widget.delFiles.length,
        enableCamera: true,
        selectedAssets: _assetImag,
        materialOptions: MaterialOptions(
          actionBarTitle: "选择图片",
          allViewTitle: "全部图片",
          // actionBarColor: "#aaaaaa",
          // actionBarTitleColor: "#bbbbbb",
          lightStatusBar: false,
          // statusBarColor: '#abcdef',
          // startInAllView: true,
          textOnNothingSelected: "请选择图片",
          // selectCircleStrokeColor: "#000000",
          selectionLimitReachedText: "最多选择${widget.maxImages}张图片",
        ),
      );
      if (!mounted) return;
      if (requestList.length != 0) {
        _assetImag = requestList;
        widget.addFiles.clear();
        for (int i = 0; i < requestList.length; i++) {
          ByteData byteData = await requestList[i].getByteData(quality: 80);
          List<int> imageData = byteData.buffer.asUint8List();
          String fileName = "${Uuid().v1()}.png";
          widget.addFiles.add(MapEntry(widget.uploadKey, MultipartFile.fromBytes(imageData, filename: fileName)));
        }
        update();
      }
    } catch (e) {
      debugPrint(LqrUntils.printStr(e));
    }
  }

  Widget content() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: Lqr.ui.width(20),
        crossAxisSpacing: Lqr.ui.width(20),
      ),
      itemCount: _widget.length,
      itemBuilder: (BuildContext context, int i) {
        return _widget[i];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.title == null
        ? Container()
        : Container(
            alignment: Alignment.centerLeft,
            padding: LqrEdge.edgeA(size: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: LqrEdge.edgeB(size: 10),
                  child: Text(widget.title, style: TextStyle(fontSize: Lqr.ui.size(30))),
                ),
                widget.hintText != null
                    ? Container(
                        margin: LqrEdge.edgeB(size: 10),
                        child: Text(
                          "${widget.hintText}  (长按删除图片)",
                          style: TextStyle(fontSize: Lqr.ui.size(24), color: LqrText.color2),
                        ),
                      )
                    : Container(),
                content(),
              ],
            ),
          );
  }
}

class LqrPickerImageUrl {
  String id;
  String url;
  LqrPickerImageUrl({this.id, this.url});
}
