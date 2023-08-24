import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends ConsumerStatefulWidget {
  final String url;
  const VideoPlayerView({required this.url, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoPlayerViewState();
}

class _VideoPlayerViewState extends ConsumerState<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"));

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 9,
        allowFullScreen: true,
        autoInitialize: true,
        customControls: const MaterialControls(
          showPlayButton: true,
        ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
