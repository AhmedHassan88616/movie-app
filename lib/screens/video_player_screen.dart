import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final YoutubePlayerController youtubePlayerController;

  VideoPlayerScreen({Key key, @required this.youtubePlayerController})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() =>
      _VideoPlayerScreenState(youtubePlayerController);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final YoutubePlayerController youtubePlayerController;

  _VideoPlayerScreenState(this.youtubePlayerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: youtubePlayerController,
            ),
          ),
          Positioned(top: 40,right: 20,
          child: IconButton(icon: Icon(EvaIcons.closeCircle,color: Colors.white,),onPressed: (){
            Navigator.pop(context);
          },),)
        ],
      ),
    );
  }
}
