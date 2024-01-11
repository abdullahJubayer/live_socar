import 'package:flutter/material.dart';

import '../theme/custom_themes.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      this.borderRadius = 15.0,
      required this.child,
      this.onTap,
      this.onLongPress,
      this.padding,
      this.backgroundColor,
      this.margin,
      this.borderWidth,
      this.borderColor,
      this.gradient,
      this.elevation = 0})
      : super(key: key);

  final Widget child;
  final double borderRadius;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final double? borderWidth;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderWidth == null
            ? null
            : Border.all(
                width: borderWidth ?? 0,
                color: borderColor ?? CustomColors.outline,
              ),
        color: backgroundColor ?? theme.cardColor,
        boxShadow: [
          if (elevation != 0)
            BoxShadow(
              color: Colors.grey,
              offset: Offset(elevation / 10, elevation / 10), //(x,y)
              blurRadius: 0.0,
            ),
        ],
      ),
      // width: double.infinity,
      margin: margin,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: child),
        ),
      ),
    );
  }
}
