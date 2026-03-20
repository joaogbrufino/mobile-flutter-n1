import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Card de post estilo feed com curtir e modal de comentário.
class FeedPostCard extends StatefulWidget {
  const FeedPostCard({
    super.key,
    required this.username,
    required this.location,
    required this.likesLabel,
    required this.caption,
    required this.imageAssetPath,
    required this.imageGradientIndex,
  });

  final String username;
  final String location;
  final String likesLabel;
  final String caption;
  final String imageAssetPath;
  final int imageGradientIndex;

  @override
  State<FeedPostCard> createState() => _FeedPostCardState();
}

class _FeedPostCardState extends State<FeedPostCard> {
  static const Color _likeRed = Color(0xFFE41E3F);

  bool _liked = false;

  static const List<List<Color>> _gradients = [
    [Color(0xFF001F3F), Color(0xFF2E5077)],
    [Color(0xFF1A3A5C), Color(0xFF001F3F)],
    [Color(0xFF0B2545), Color(0xFF4A6FA5)],
  ];

  void _toggleLike() {
    setState(() => _liked = !_liked);
  }

  void _showCommentSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.viewInsetsOf(sheetContext).bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Comentar',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Publicação de ${widget.username}',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.black.withValues(alpha: 0.55),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                maxLines: 4,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Escreva um comentário…',
                  hintStyle: TextStyle(color: AppColors.black.withValues(alpha: 0.45)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.navy, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(sheetContext),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: AppColors.black.withValues(alpha: 0.7)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.navy,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: () => Navigator.pop(sheetContext),
                    child: const Text('Publicar'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final g = _gradients[widget.imageGradientIndex % _gradients.length];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.navyMuted,
                child: Text(
                  widget.username.isNotEmpty ? widget.username[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.location,
                      style: TextStyle(
                        color: AppColors.black.withValues(alpha: 0.55),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: AppColors.black.withValues(alpha: 0.65)),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            widget.imageAssetPath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: g,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.photo_outlined,
                    size: 64,
                    color: AppColors.white.withValues(alpha: 0.35),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
          child: Row(
            children: [
              IconButton(
                onPressed: _toggleLike,
                icon: Icon(
                  _liked ? Icons.favorite : Icons.favorite_border,
                  color: _liked ? _likeRed : AppColors.black,
                ),
              ),
              IconButton(
                onPressed: _showCommentSheet,
                icon: const Icon(Icons.chat_bubble_outline, color: AppColors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined, color: AppColors.black),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border, color: AppColors.black),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.likesLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: AppColors.black, fontSize: 14, height: 1.35),
              children: [
                TextSpan(
                  text: '${widget.username} ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: widget.caption),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: AppColors.divider),
      ],
    );
  }
}
