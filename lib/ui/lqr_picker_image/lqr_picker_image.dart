import 'package:flutter_lqrui/lqr_common.dart';

class LqrPickerImage extends StatefulWidget {
  /// [最多选择数量]
  final int maxImages;

  /// [选择回调]
  final Function(List<MapEntry<String, MultipartFile>> val) onChange;

  /// [上传的字段名]
  final String uploadKey;

  LqrPickerImage({
    Key key,
    this.maxImages,
    this.onChange,
    this.uploadKey = "files",
  }) : super(key: key);
  @override
  _LqrPickerImageState createState() => new _LqrPickerImageState();
}

class _LqrPickerImageState extends State<LqrPickerImage> {
  List<Asset> imageAsset = List<Asset>();
  List<MapEntry<String, MultipartFile>> _update = [];
  List<String> _network = [];

  //多图选择器
  Future pickImage() async {
    try {
      var requestList = await MultiImagePicker.pickImages(
        maxImages: widget.maxImages,
        enableCamera: true,
        selectedAssets: imageAsset,
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
        setState(() => imageAsset = requestList);
        _update.clear();
        for (int i = 0; i < requestList.length; i++) {
          ByteData byteData = await requestList[i].getByteData(quality: 80);
          List<int> imageData = byteData.buffer.asUint8List();
          // String fileName = "${Uuid().v1()}.png";
          _update.add(MapEntry(widget.uploadKey, MultipartFile.fromBytes(imageData)));
        }
        widget.onChange(_update);
      }
    } catch (e) {
      debugPrint(LqrUntils.printStr(e));
    }
  }

  Widget content() {
    // int _itemCount;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: Lqr.ui.width(20),
        crossAxisSpacing: Lqr.ui.width(20),
      ),
      itemCount: imageAsset.length < widget.maxImages ? imageAsset.length + 1 : imageAsset.length,
      itemBuilder: (BuildContext context, int i) {
        int imgIndex = imageAsset.length < widget.maxImages ? i - 1 : i;
        return i == 0 && imageAsset.length < widget.maxImages
            ? GestureDetector(onTap: pickImage, child: Image.asset("assets/images/pickImage.png", fit: BoxFit.fill))
            : GestureDetector(
                onTap: pickImage,
                onLongPress: () {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('删除此图片'),
                        actions: <Widget>[
                          FlatButton(child: Text('取消'), onPressed: () => Navigator.of(context).pop()),
                          FlatButton(
                            child: Text('删除'),
                            onPressed: () {
                              setState(() {
                                imageAsset.removeAt(imgIndex);
                                _update.removeAt(imgIndex);
                                widget.onChange(_update);
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: AssetThumb(asset: imageAsset[imgIndex], width: 300, height: 300),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return content();
    // if (widget.title == null) {
    //   return content();
    // } else {
    //   return Container(
    //     alignment: Alignment.centerLeft,
    //     padding: LqrEdge.edgeA(size: 10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: <Widget>[
    //         Container(
    //           margin: LqrEdge.edgeB(size: 10),
    //           child: Text(widget.title, style: TextStyle(fontSize: Lqr.ui.size(30))),
    //         ),
    //         widget.hintText != null
    //             ? Container(
    //                 margin: LqrEdge.edgeB(size: 10),
    //                 child: Text(
    //                   "${widget.hintText}  (长按删除图片)",
    //                   style: TextStyle(fontSize: Lqr.ui.size(24), color: LqrText.color2),
    //                 ),
    //               )
    //             : Container(),
    //         content(),
    //       ],
    //     ),
    //   );
    // }
  }
}
