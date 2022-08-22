import 'dart:async';

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
  late VideoPlayerController _controller;
  var  visibleplay = true;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
     widget.model.videoURL)
      ..initialize().then((_) {
        setState(() {});
      });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
          child:AspectRatio(child:  GestureDetector(
            onTap: (){
              setState((){
                visibleplay = true;
                Timer(Duration(seconds: 3),(){
                  setState((){
                    visibleplay = _controller.value.isPlaying ? false:true;
                  });
                });
              });
            },
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
                          Timer(Duration(seconds: 3),(){
                            visibleplay =    _controller.value.isPlaying ? false:true;
                            setState((){});
                          });
                        });
                      },
                      child: visibleplay ? Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_circle_outline_rounded,size: 80,color: Colors.white,): SizedBox()
                  ),
                )
              ],
            ),
          ),aspectRatio: _controller.value.aspectRatio),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}