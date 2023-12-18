import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  String video_url;
  VideoScreen({required this.video_url, super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;
  @override
  void initState() {
    Uri videoUri = Uri.parse(widget.video_url);

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
      body: GestureDetector(
        onTap: () {
          setState(() {
            isPlaying = !isPlaying;
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Center(
            child: _controller.value.isInitialized
                ? Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Align(
                        alignment: FractionalOffset(0.5, 0.5),
                        child: AnimatedOpacity(
                          opacity: (isPlaying) ? 0.0 : 1.0,
                          duration: Duration(microseconds: 750),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    AutoOrientation.portraitAutoMode();
    _controller.dispose();
    super.dispose();
  }
}
