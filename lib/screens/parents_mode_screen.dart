import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:JC/screens/english.dart';
import 'package:JC/screens/french.dart';
import 'package:JC/screens/home_screen.dart';
import 'package:JC/widgets/cards.dart';
import 'package:flutter/src/widgets/sliver.dart';


class ParentsMode extends StatefulWidget {
  static const routeName = '/parents';

  @override
  _ParentsModeState createState() => _ParentsModeState();
}

class _ParentsModeState extends State<ParentsMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Select Language'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text('English'),
                onPressed: (){
                   Navigator.of(context).pushReplacementNamed(English.routeName);
                }),
                RaisedButton(
                  child: Text('Francais'),
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed(French.routeName);
                  })
            ],
          ),
        )
    );
  }
}

