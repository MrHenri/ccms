import 'package:ccms/frontend/training_widgets.dart/video_play.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {

  final String videoReference;

  VideoPage({

    this.videoReference,
    Key key,
  }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return VideoPlay(
      videoPlayerController: VideoPlayerController.network(widget.videoReference),
    );
  }
}
