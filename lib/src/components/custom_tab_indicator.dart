import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;
  final Color startColor;
  final Color endColor;

  CustomTabIndicator(
    this.startColor,
    this.endColor,
  ) : _painter = _CirclePainter(
          defaultRadiusSm,
          startColor,
          endColor
        );
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final double _radius;
  final Color _startColor;
  final Color _endColor;

  _CirclePainter(this._radius, this._startColor, this._endColor);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    double left = offset.dx;
    double top = cfg.size!.height * 0.9;
    double right = cfg.size!.width + offset.dx;
    double bottom = cfg.size!.height;

    final Rect rect = Rect.fromLTRB(left, top, right, bottom);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(_radius));
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [_startColor, _endColor],
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }
}
