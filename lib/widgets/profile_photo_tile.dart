import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProfilePhotoTile extends StatelessWidget {
  const ProfilePhotoTile({
    super.key,
    required this.assetPath,
    required this.fallbackIndex,
  });

  final String assetPath;
  final int fallbackIndex;

  @override
  Widget build(BuildContext context) {
    final a = 0.35 + (fallbackIndex % 5) * 0.08;
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.navy.withValues(alpha: a),
                  AppColors.navyMuted.withValues(alpha: 0.85),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: AppColors.white, width: 1),
            ),
            child: Icon(
              Icons.image_outlined,
              color: AppColors.white.withValues(alpha: 0.5),
              size: 28,
            ),
          );
        },
      ),
    );
  }
}
