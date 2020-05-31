import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ccms/frontend/training_widgets.dart/video_play.dart';

class TrainingPage extends StatefulWidget {
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Treinamentos'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
      body: Column(children: <Widget>[
        Center(
          child: RaisedButton(
            child: Text('Tópico 1'),
            onPressed: () {
              VideoPlay(
                videoPlayerController: VideoPlayerController.asset('assets/TheOfficeOpening.mp4'),
                looping: true,
              );
            },
          ),
        ),
        Center(
          child: RaisedButton(
              child: Text('Tópico 2'),
              onPressed: () {
                VideoPlay(
                  videoPlayerController: VideoPlayerController.asset('assests/TheOfficeOpening.mp4'),
                  looping: true,
                );
              }),
        ),
        Center(
          child: RaisedButton(
              child: Text('Tópico 3'),
              onPressed: () {
                VideoPlay(videoPlayerController: VideoPlayerController.asset('assests/TheOfficeOpening'),
                looping: true,
                );
              }),
        ),
      ]),
    );
  }
}
