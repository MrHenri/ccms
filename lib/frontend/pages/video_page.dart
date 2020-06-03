import 'package:flutter/material.dart';
import 'package:ccms/frontend/training_widgets.dart/video_play.dart';
import 'package:ccms/backend/models/video.dart';
import 'package:video_player/video_player.dart';


class VideoPage extends StatefulWidget {
  
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VideoPlay(
        videoPlayerController: VideoPlayerController.asset('assests/TheOfficeOpening.mp4'),
        looping: false,
      ),
    );
  }
}