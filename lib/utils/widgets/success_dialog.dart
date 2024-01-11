import 'package:flutter/material.dart';
import 'package:live_score/utils/img_assets/img_assets.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:live_score/utils/widgets/widget_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_card.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    this.assetIcon,
    this.onClose,
  });

  final String title;
  final String message;
  final String? assetIcon;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    assetIcon ?? ImageAssets.icSuccess,
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    title,
                    style: theme.textTheme.titleLarge,
                  ).padding(top: 32),
                  Text(
                    message,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ).padding(all: 24),
                ],
              ).verticalPadding(100),
              Positioned(
                  top: 10,
                  right: 10,
                  child: CustomCard(
                      onTap: onClose ?? () => Navigator.pop(context),
                      backgroundColor: Colors.black12,
                      borderRadius: 16,
                      padding: const EdgeInsets.all(5),
                      child: const Icon(FontAwesomeIcons.xmark)))
            ],
          ),
        ),
      ),
    );
  }
}
