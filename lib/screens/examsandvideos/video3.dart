import 'package:JC/screens/home_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class VideoPlayer3 extends StatefulWidget {
  final Function nextPage;
  VideoPlayer3(this.nextPage);
  
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      actions: [
         RaisedButton
            (
              color: Colors.white,
              onPressed: (){
              widget.nextPage();
            } ,
            child: Text('Next'),),
        
      ],
      leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            title: Text('اولاد يسوع'),
            centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[600],
        child: Stack(
          
          children: [
            
            Center(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: 'HjBpCHEFz-I',
                ),
              ),
            ),
                        
          ],
        ),
      ),
    );
  }
}