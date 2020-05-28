import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlay extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoPlay({

    this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  ChewieController _controller;

  @override
  void initState(){
    super.initState();

    _controller = ChewieController(
    videoPlayerController: widget.videoPlayerController,
    aspectRatio: 16/9,
    autoInitialize: true,
    autoPlay: true,
    allowFullScreen: true,
    fullScreenByDefault: true,
    showControls: true,
    looping: widget.looping,
    errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Future<void> dispose() async{
    super.dispose();

    _controller.dispose();
    widget.videoPlayerController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Chewie(
        controller: _controller       
      ),
    );
  }
}
