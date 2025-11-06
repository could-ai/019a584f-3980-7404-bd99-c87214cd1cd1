import 'package:flutter/material.dart';
import '../models/video_model.dart';
import '../widgets/video_page.dart';

class VideoFeed extends StatefulWidget {
  const VideoFeed({super.key});

  @override
  State<VideoFeed> createState() => _VideoFeedState();
}

class _VideoFeedState extends State<VideoFeed> {
  late PageController _pageController;
  int _currentPage = 0;

  // Mock video data - Replace with real data from backend
  final List<VideoModel> _videos = [
    VideoModel(
      id: '1',
      username: '@marie_styles',
      description: 'Nouvelle danse tendance 🔥 #dance #viral #fyp',
      likes: 125000,
      comments: 3421,
      shares: 892,
      thumbnailUrl: 'https://picsum.photos/400/700?random=1',
      videoUrl: '',
      userAvatar: 'https://i.pravatar.cc/150?img=1',
    ),
    VideoModel(
      id: '2',
      username: '@chef_alex',
      description: 'Recette rapide de pâtes carbonara 🍝 #cuisine #food',
      likes: 89000,
      comments: 1234,
      shares: 456,
      thumbnailUrl: 'https://picsum.photos/400/700?random=2',
      videoUrl: '',
      userAvatar: 'https://i.pravatar.cc/150?img=2',
    ),
    VideoModel(
      id: '3',
      username: '@travel_sophie',
      description: 'Les plus beaux endroits de Paris 🗼✨ #voyage #paris',
      likes: 234000,
      comments: 5678,
      shares: 1234,
      thumbnailUrl: 'https://picsum.photos/400/700?random=3',
      videoUrl: '',
      userAvatar: 'https://i.pravatar.cc/150?img=3',
    ),
    VideoModel(
      id: '4',
      username: '@fitness_tom',
      description: 'Entraînement complet en 10 minutes 💪 #fitness #sport',
      likes: 167000,
      comments: 2890,
      shares: 723,
      thumbnailUrl: 'https://picsum.photos/400/700?random=4',
      videoUrl: '',
      userAvatar: 'https://i.pravatar.cc/150?img=4',
    ),
    VideoModel(
      id: '5',
      username: '@comedy_luc',
      description: 'Quand tu essaies de cuisiner 😂 #humour #comedy',
      likes: 456000,
      comments: 8912,
      shares: 2345,
      thumbnailUrl: 'https://picsum.photos/400/700?random=5',
      videoUrl: '',
      userAvatar: 'https://i.pravatar.cc/150?img=5',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: _videos.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return VideoPage(
          video: _videos[index],
          isActive: index == _currentPage,
        );
      },
    );
  }
}