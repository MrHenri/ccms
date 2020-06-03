import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ccms/frontend/training_widgets.dart/video_play.dart';
import 'package:ccms/backend/models/video.dart';

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
              Navigator.of(context).pushNamed('/videoPage');
            },
          ),
        ),
        Center(
          child: RaisedButton(
              child: Text('Tópico 2'),
              onPressed: () {
                Navigator.of(context).pushNamed('/videoPage');
              }),
        ),
        Center(
          child: RaisedButton(
              child: Text('Tópico 3'),
              onPressed: () {
                Video().setVideoReference('assets/videos/MostPopularLanguages.mp4');
                print(Video().getVideoReference());
                Navigator.of(context).pushNamed('/videoPage');
              }),
        ),
      ]),
    );
  }
}
