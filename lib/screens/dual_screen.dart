import 'package:flutter/material.dart';
import 'package:JC/screens/exam_screen.dart';
import 'package:JC/screens/video_screen.dart';

class AllContent extends StatefulWidget {
  static const routeName = '/dual';

  @override
  _AllContentState createState() => _AllContentState();
}

class _AllContentState extends State<AllContent> {
  PageController controller;
  @override
  void initState() {
    super.initState();
    controller= PageController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void nextPage(){
    controller.nextPage(
      duration: Duration(seconds: 1), 
      curve: Curves.decelerate
      );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        VideoPlayer(nextPage),
        Quiz1(),
      ],
    );
  }
}