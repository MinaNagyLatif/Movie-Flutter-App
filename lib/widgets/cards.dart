import 'package:flutter/material.dart';
import 'package:my_shop/screens/dual_screen.dart';
import 'package:my_shop/screens/examsandvideos/dual2.dart';
import 'package:my_shop/screens/examsandvideos/duel3.dart';
import 'package:my_shop/screens/examsandvideos/duel5.dart';
import 'package:my_shop/screens/examsandvideos/duel6.dart';
import 'package:my_shop/screens/examsandvideos/duel7.dart';
import 'package:my_shop/screens/examsandvideos/yarab.dart';
import 'package:my_shop/screens/video_screen.dart';

class CardContent extends StatelessWidget {
  String title, sub;
  int x;
    CardContent({this.title, this.sub, this.x });
  @override
  Widget build(BuildContext context) {
    return Card (
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
            
              title: Text(title, style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),
                  ),
              
              trailing: IconButton(icon: Icon(
                Icons.play_arrow), 
                onPressed: (){
                  if (x == 1) {
                    Navigator.of(context).pushReplacementNamed(AllContent.routeName);
                  }else if (x==2) {
                    Navigator.of(context).pushReplacementNamed(AllContent2.routeName);
                  }else if (x==3) {
                    Navigator.of(context).pushReplacementNamed(AllContent3.routeName);
                  }else if (x==4) {
                    Navigator.of(context).pushReplacementNamed(AllContent4.routeName);
                  }else if (x==5) {
                    Navigator.of(context).pushReplacementNamed(AllContent5.routeName);
                  }else if (x==6) {
                    Navigator.of(context).pushReplacementNamed(AllContent6.routeName);
                  }else if (x==7) {
                    Navigator.of(context).pushReplacementNamed(AllContent7.routeName);
                  }
                  
                }
                ),
            ),
          );
  }
}