import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_utils.dart';

class TopArrowClipperShadow extends ShapeBorder {
  final double arrowHeight;
  final double arrowWidth;
  final double? rightMargin;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  const TopArrowClipperShadow({
    required this.arrowHeight,
    required this.arrowWidth,
    required this.rightMargin,
  });

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  final double holeSize = 70;
  final double borderRadius = 10;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var startX = rect.topRight.dx;
    var startY = rect.topRight.dy;

    final startPoint = startX -
        (rightMargin ?? AppDimens.dimensScreenHorizontalMargin.w / 1.2);
    final center = startPoint - (arrowWidth / 2);
    final endPoint = startPoint - arrowWidth;

    return Path.combine(
      PathOperation.union,
      Path()
        ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)))
        ..close(),
      Path()
        ..moveTo(startPoint, startY)
        ..lineTo(center, startY - arrowHeight)
        ..lineTo(endPoint, startY)
        ..close(),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
