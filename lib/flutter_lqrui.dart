/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-15 18:14:00
*/

import './lqr_common.dart';
export './lqr_common.dart';

class Lqr {
  static Lqr ui = new Lqr();
  // static Lqr ui = new Lqr();

  /// [scaffold context]
  BuildContext scaffoldCtx;

  /// [设计宽度]
  final double designWidth;

  /// [设计高度]
  final double designHeight;

  /// [主要色] primary color
  final Color primaryColor;

  /// [背景色] background color
  final Color backgroundColor;

  /// [成功色] Success color
  final Color successColor;

  /// [警告色] Warning color
  final Color warningColor;

  /// [危险色] Danger int
  final Color dangerColor;

  /// [信息色] Info int
  final Color infoColor;

  /// [图标颜色] Info int
  final Color iconColor;

  /// [图片加载样式]
  final Widget imageLoading;

  /// [图片失败样式]
  final Widget imageError;

  /// [单选 选中样式]
  final Widget radioOn;

  /// [单选 未选中样式]
  final Widget radioOff;

  /// [时间格式]
  final String format;

  /// [边距]
  final double edgeInsets;

  /// [圆角]
  final double radius;

  Lqr({
    this.scaffoldCtx,
    this.designWidth = 750,
    this.designHeight = 1334,
    this.primaryColor = const Color(0xFF0085F2),
    this.backgroundColor = const Color(0xFFF5F5F9),
    this.successColor = const Color(0xFF67C23A),
    this.warningColor = const Color(0xFFE6A23C),
    this.dangerColor = const Color(0xFFF56C6C),
    this.infoColor = const Color(0xFF909399),
    this.iconColor = const Color(0xFFC0C4CC),
    this.imageLoading = const LqrImageLoading(),
    this.imageError = const LqrImageError(),
    this.radioOn = const LqrRadioOn(),
    this.radioOff = const LqrRadioOff(),
    this.format = "yyyy-M-d HH:mm:ss",
    this.edgeInsets = 20.0,
    this.radius = 20.0,
  });

  void init(BuildContext context) {
    setDesignWHD(designWidth, designHeight, density: 3);
  }

  double size(double style) => ScreenUtil.getInstance().getAdapterSize(style);
  double width(double style) => style == null ? null : ScreenUtil.getInstance().getAdapterSize(style);
  double height(double style) => style == null ? null : ScreenUtil.getInstance().getAdapterSize(style);
}
