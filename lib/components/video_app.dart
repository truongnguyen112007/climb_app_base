import 'package:chewie/chewie.dart';
import 'package:climb_app_base/data/feed_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  final FeedModel model;

  const VideoApp({Key? key, required this.model}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  var visiblePlay = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.model.videoURL)
          ..initialize().then((_) {});
    _chewieController =
        ChewieController(videoPlayerController: _videoPlayerController!);
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        child: _chewieVideoPlayer());
  }

  Widget _chewieVideoPlayer() {
    return Chewie(
      controller: _chewieController!,
    );
  }
}
