import 'package:flutter/material.dart';

import '../constants/image_assets.dart';
import '../theme/app_colors.dart';
import '../widgets/profile_photo_tile.dart';
import '../widgets/profile_stat.dart';

/// Perfil com cabeçalho e grade de fotos (estilo galeria).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.navy, width: 2),
                      color: AppColors.navyMuted,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 48,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileStat(value: '3', label: 'publicações'),
                        ProfileStat(value: '1.2 mil', label: 'seguidores'),
                        ProfileStat(value: '312', label: 'seguindo'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'João Guilherme',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Me da nota 10 PAVAN.',
                    style: TextStyle(
                      color: AppColors.black.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.black,
                            side: const BorderSide(color: AppColors.divider),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text('Editar perfil'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.black,
                            side: const BorderSide(color: AppColors.divider),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text('Compartilhar'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProfilePhotoTile(
                    assetPath: ImageAssets.profileGrid[index],
                    fallbackIndex: index,
                  );
                },
                childCount: ImageAssets.profileGrid.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
