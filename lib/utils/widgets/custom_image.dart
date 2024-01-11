import 'package:flutter/material.dart';
import 'package:live_score/utils/img_assets/img_assets.dart';
import 'package:live_score/utils/widgets/widget_extension.dart';

import 'custom_card.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imageUrl,
    this.defaultImage,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
    this.borderWidth,
  }) : super(key: key);
  final String? defaultImage;
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      borderRadius: borderRadius ?? 0,
      borderWidth: borderWidth,
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Image.asset(
              defaultImage ?? ImageAssets.icLogo,
              width: width,
              fit: BoxFit.contain,
              color: Colors.black12,
            ).padding(all: 16),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            height: 100,
            child: Center(
              child: Text('loading...'),
            ),
          );
        },
      ),
    );
  }
}
