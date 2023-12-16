import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    Uri videoUri = Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    _controller = VideoPlayerController.networkUrl(videoUri);

    _controller.initialize().then((value) {
      setState(() {
        AutoOrientation.landscapeAutoMode();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
