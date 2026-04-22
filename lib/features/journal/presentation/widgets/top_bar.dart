import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class JournalTopBar extends StatelessWidget {
  final Widget? leftWidget;
  final String? title;
  final Widget? rightWidget;
  final bool showBackButton;
  final VoidCallback? onBackPress;
  final bool centerTitle;
  final TextStyle? titleStyle;

  const JournalTopBar({
    super.key,
    this.leftWidget,
    this.title,
    this.rightWidget,
    this.showBackButton = false,
    this.onBackPress,
    this.centerTitle = true,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left section
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leftWidget != null)
                leftWidget!
              else if (showBackButton)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.primary,
                  onPressed: onBackPress ?? () => Navigator.pop(context),
                )
              else
                const SizedBox(width: 48),

              if (title != null && !centerTitle)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title!,
                    style: titleStyle ??
                        const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
            ],
          ),

          // Center section (if title is centered)
          if (title != null && centerTitle)
            Expanded(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: titleStyle ??
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
              ),
            ),

          // Right section
          if (rightWidget != null)
            rightWidget!
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}
