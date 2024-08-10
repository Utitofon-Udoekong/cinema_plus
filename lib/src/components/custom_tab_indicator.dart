import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:flutter/material.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomTabIndicator() : _painter = _CirclePainter(defaultRadiusSm);
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final double _radius;

  _CirclePainter(this._radius);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    
    double left = offset.dx;
    double top = cfg.size!.height * 0.9;
    double right = cfg.size!.width + offset.dx;
    double bottom = cfg.size!.height;

    final Rect rect = Rect.fromLTRB(
        left, top, right, bottom);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(_radius));
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [CPColors.purple, CPColors.pink],
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }
}
