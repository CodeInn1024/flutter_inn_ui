/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-05 11:11:07
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2019-12-09 12:51:21
*/

import './lqr_common.dart';
export './lqr_common.dart';

class Lqr {
  static Lqr ui = new Lqr();

  /// [scaffold context]
  final BuildContext scaffoldCtx;

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

  /// [图标]
  final String iconFamily;

  /// [图片加载样式]
  final Widget imageLoading;

  /// [图片失败样式]
  final Widget imageError;

  /// [单选 选中样式]
  final Widget radioOn;

  /// [单选 未选中样式]
  final Widget radioOff;

  const Lqr({
    this.scaffoldCtx,
    this.designWidth = 750,
    this.designHeight = 1334,
    this.primaryColor = LqrColor.blue,
    this.backgroundColor = const Color(0xffeff0f2),
    this.successColor = const Color(0xFF67C23A),
    this.warningColor = const Color(0xFFE6A23C),
    this.dangerColor = const Color(0xFFF56C6C),
    this.infoColor = const Color(0xFF909399),
    this.iconFamily = 'IconFont',
    this.imageLoading = const LqrImageLoading(),
    this.imageError = const LqrImageError(),
    this.radioOn = const LqrRadioOn(),
    this.radioOff = const LqrRadioOff(),
  });

  void init(BuildContext context) {
    setDesignWHD(designWidth, designHeight, density: 3);
  }

  double size(double style) => ScreenUtil.getInstance().getAdapterSize(style);
  double width(double style) => style == 0.1 ? ScreenUtil.getInstance().screenWidth : ScreenUtil.getInstance().getAdapterSize(style);
  double height(double style) => style == 0.1 ? ScreenUtil.getInstance().screenHeight : ScreenUtil.getInstance().getAdapterSize(style);
}
