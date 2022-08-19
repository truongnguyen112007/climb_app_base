import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Stack(
            children: [
              _controller.value.isInitialized
                  ?
                 VideoPlayer(_controller)
                  : Container(),
              Center(
                child: InkWell(
                  onTap: (){
                    setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
            });
                  },
                  child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_circle_outline_rounded,size: 80,color: Colors.white,)
                ),
              )
            ],
          ),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}