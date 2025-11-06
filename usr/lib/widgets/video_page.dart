import 'package:flutter/material.dart';
import '../models/video_model.dart';
import '../widgets/video_actions.dart';
import '../widgets/video_description.dart';

class VideoPage extends StatefulWidget {
  final VideoModel video;
  final bool isActive;

  const VideoPage({
    super.key,
    required this.video,
    required this.isActive,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool _isLiked = false;
  bool _isFollowing = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Video/Image background
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.video.thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient overlay for better text visibility
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
              stops: const [0.0, 0.7, 1.0],
            ),
          ),
        ),
        // Top bar with logo and search
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Abonnements',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'Pour toi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        // Right side actions and bottom description
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left side - Video description
                  Expanded(
                    child: VideoDescription(
                      video: widget.video,
                      isFollowing: _isFollowing,
                      onFollowTap: _toggleFollow,
                    ),
                  ),
                  // Right side - Action buttons
                  VideoActions(
                    video: widget.video,
                    isLiked: _isLiked,
                    onLikeTap: _toggleLike,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}