import 'package:flutter/material.dart';
import 'package:my_shop/widgets/cards.dart';

import 'home_screen.dart';

class English extends StatelessWidget {
   static const routeName = '/English';
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
            
            CardContent(title: 'Jesus birth story',x: 6,),            
          ],
        ),
    );
  }
}