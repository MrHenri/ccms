import 'package:flutter/material.dart';
import 'package:ccms/frontend/pages/video_page.dart';

class TrainingPage extends StatefulWidget {
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  List videoReferences = [
    'https://firebasestorage.googleapis.com/v0/b/ccms-cell.appspot.com/o/treinamentos%2FTheOfficeOpening.mp4?alt=media&token=570042d7-d373-4930-bf0d-c7e6bb37cfd2',
    'https://firebasestorage.googleapis.com/v0/b/ccms-cell.appspot.com/o/treinamentos%2FMostPopularLanguages.mp4?alt=media&token=71bd1215-5a48-4346-935c-27b8008d0d44',
    'https://firebasestorage.googleapis.com/v0/b/ccms-cell.appspot.com/o/treinamentos%2FAttack%20on%20Titan%20Season%204%20Trailer%20Subbed%20(HD).mp4?alt=media&token=e0d58df8-49a1-4fd3-b487-7c9fa99eac52'
  ];
  List videoNames = [
    'The Office',
    'Most Popular Languages',
    'Attack on Titan Final Season'
  ];

  Widget cardList(String topicName, List videoReferences, List videoNames) {
    return ExpansionTile(
      title: Text('$topicName', textAlign: TextAlign.center),
      children: <Widget>[videoList(videoReferences, videoNames)],
    );
  }

  Widget videoList(List videoReferences, List videoNames) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: videoReferences.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text('${videoNames[index]}'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VideoPage(videoReference: videoReferences[index]);
              }));
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treinamentos'),
        centerTitle: true,
      ),
      body: Wrap(
        children: <Widget>[
          cardList('Tópico 1', videoReferences, videoNames),
          cardList('Tópico 2', videoReferences, videoNames),
          cardList('Tópico 3', videoReferences, videoNames),
          cardList('Tópico 4', videoReferences, videoNames),
          cardList('Tópico 5', videoReferences, videoNames),
          cardList('Tópico 6', videoReferences, videoNames),
        ],
      ),
    );
  }
}
