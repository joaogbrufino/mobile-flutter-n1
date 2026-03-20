import 'package:flutter/material.dart';

import '../constants/image_assets.dart';
import '../theme/app_colors.dart';
import '../widgets/feed_post_card.dart';

/// Feed estilo Instagram: lista vertical de posts (sem stories).
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  static final List<_PostData> _posts = [
    _PostData(
      username: 'marina.v',
      location: 'Salvador, BA',
      likes: 'Curtido por ana e outras pessoas',
      caption: 'Tarde perfeita na orla #katana',
      imagePath: ImageAssets.feedPosts[0],
    ),
    _PostData(
      username: 'dev_labs',
      location: 'Remoto',
      likes: '128 curtidas',
      caption: 'Flutter + café = produtividade.',
      imagePath: ImageAssets.feedPosts[1],
    ),
    _PostData(
      username: 'katana.app',
      location: 'Brasil',
      likes: 'Curtido por você e 512 pessoas',
      caption: 'Interface limpa, navegação fluida.',
      imagePath: ImageAssets.feedPosts[2],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  const Text(
                    'INSTAGRAM',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border, color: AppColors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline, color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final p = _posts[index];
                return FeedPostCard(
                  username: p.username,
                  location: p.location,
                  likesLabel: p.likes,
                  caption: p.caption,
                  imageAssetPath: p.imagePath,
                  imageGradientIndex: index,
                );
              },
              childCount: _posts.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _PostData {
  const _PostData({
    required this.username,
    required this.location,
    required this.likes,
    required this.caption,
    required this.imagePath,
  });

  final String username;
  final String location;
  final String likes;
  final String caption;
  final String imagePath;
}
