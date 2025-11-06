class VideoModel {
  final String id;
  final String username;
  final String description;
  final int likes;
  final int comments;
  final int shares;
  final String thumbnailUrl;
  final String videoUrl;
  final String userAvatar;

  VideoModel({
    required this.id,
    required this.username,
    required this.description,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.userAvatar,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] as String,
      username: json['username'] as String,
      description: json['description'] as String,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      shares: json['shares'] as int,
      thumbnailUrl: json['thumbnail_url'] as String,
      videoUrl: json['video_url'] as String,
      userAvatar: json['user_avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'description': description,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'thumbnail_url': thumbnailUrl,
      'video_url': videoUrl,
      'user_avatar': userAvatar,
    };
  }
}