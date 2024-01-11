import 'package:flutter/material.dart';
import 'package:live_score/utils/theme/custom_themes.dart';

class DashSeparator extends StatelessWidget {
  const DashSeparator({
    Key? key,
    this.height = 1,
    this.color,
    this.dashWidth = 10,
    this.direction = Axis.horizontal,
  }) : super(key: key);
  final double height;
  final Color? color;
  final double dashWidth;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return direction == Axis.horizontal
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final boxWidth = constraints.constrainWidth();
              final dashHeight = height;
              final dashCount = (boxWidth / (2 * dashWidth)).floor();
              return Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: List.generate(dashCount, (_) {
                  return SizedBox(
                    width: dashWidth,
                    height: dashHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: color ?? theme.dividerColor),
                    ),
                  );
                }),
              );
            },
          )
        : CustomPaint(
            size: const Size(1, double.infinity),
            painter:
                DashedLineVerticalPainter(color: color ?? theme.dividerColor));
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  DashedLineVerticalPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
