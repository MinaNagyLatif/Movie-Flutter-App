import 'package:flutter/material.dart';
import 'package:my_shop/screens/exam_screen.dart';
import 'package:my_shop/screens/examsandvideos/exam2.dart';
import 'package:my_shop/screens/examsandvideos/exam4.dart';
import 'package:my_shop/screens/examsandvideos/exam5.dart';
import 'package:my_shop/screens/examsandvideos/video2.dart';
import 'package:my_shop/screens/examsandvideos/video4.dart';
import 'package:my_shop/screens/examsandvideos/video5.dart';
import 'package:my_shop/screens/video_screen.dart';

class AllContent5 extends StatefulWidget {
  static const routeName = '/dual5';

  @override
  _AllContentState createState() => _AllContentState();
}

class _AllContentState extends State<AllContent5> {
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
        VideoPlayer5(nextPage),
        Quiz5(),
      ],
    );
  }
}