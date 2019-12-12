/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 08:51:09
*/

import 'package:flutter_lqrui/lqr_common.dart';

class LqrImage extends StatelessWidget {
  /// [图片宽]
  final double width;

  /// [图片高]
  final double height;

  /// [图片链接]
  final String src;

  /// [图片裁剪、缩放的模式]
  final BoxFit fit;

  /// [图片加载样式]
  final Widget loadingWidget;

  /// [图片失败样式]
  final Widget errorWidget;

  /// [点击事件]
  final Function() onTap;

  LqrImage({
    Key key,
    @required this.width,
    @required this.height,
    @required this.src,
    this.fit = BoxFit.cover,
    Widget errorWidget,
    Widget loadingWidget,
    this.onTap,
  })  : errorWidget = errorWidget ?? Lqr.ui.imageError,
        loadingWidget = loadingWidget ?? Lqr.ui.imageLoading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: Lqr.ui.width(width),
        height: Lqr.ui.width(height),
        child: CachedNetworkImage(
          imageUrl: src ?? '',
          placeholder: (context, url) => LqrImageLoading(),
          errorWidget: (context, url, error) => errorWidget,
          fit: fit,
        ),
      ),
    );
  }
}

class LqrImageLoading extends StatelessWidget {
  const LqrImageLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Lqr.ui.width(24),
        height: Lqr.ui.width(24),
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Theme.of(context).primaryColor,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

class LqrImageError extends StatelessWidget {
  const LqrImageError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/imageError.jpg", fit: BoxFit.cover);
  }
}
