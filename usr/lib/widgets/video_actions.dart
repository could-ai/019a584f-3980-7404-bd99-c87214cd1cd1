import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoActions extends StatelessWidget {
  final VideoModel video;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const VideoActions({
    super.key,
    required this.video,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // User avatar with follow button
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(video.userAvatar),
                backgroundColor: Colors.grey[800],
              ),
              Positioned(
                bottom: -4,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF0050),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Like button
          _buildActionButton(
            icon: isLiked ? Icons.favorite : Icons.favorite_border,
            label: _formatCount(video.likes + (isLiked ? 1 : 0)),
            color: isLiked ? const Color(0xFFFF0050) : Colors.white,
            onTap: onLikeTap,
          ),
          const SizedBox(height: 20),
          // Comment button
          _buildActionButton(
            icon: Icons.comment,
            label: _formatCount(video.comments),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          // Share button
          _buildActionButton(
            icon: Icons.share,
            label: _formatCount(video.shares),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          // More options (rotating disc icon for music)
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white, width: 2),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/100/100'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    Color color = Colors.white,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}