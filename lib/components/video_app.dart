import 'package:climb_app_base/data/feed_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import 'chwie/src/chewie_player.dart';

class VideoApp extends StatefulWidget {
  final FeedModel model;

  const VideoApp({Key? key, required this.model}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.model.videoURL);
    _videoPlayerController!.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        looping: true,
      );
      setState((){});
    });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chewieVideoPlayer(),
    );
  }

  Widget _chewieVideoPlayer() {
    return _chewieController != null && _videoPlayerController != null ?
    Container(child: Chewie(controller: _chewieController!),) : Center(
      child: Text("Please wait"),);
  }
}
