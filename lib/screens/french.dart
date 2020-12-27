import 'package:flutter/material.dart';
import 'package:JC/widgets/cards.dart';

import 'home_screen.dart';

class French extends StatelessWidget {
   static const routeName = '/French';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Jesus\'s Children'),
        leading:IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
            ),
      ),
      body: ListView(
          
          children: [
            
            CardContent(title: 'la naissance de Jesus Christ',x: 7,),            
          ],
        ),
    );
  }
}