import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:JC/screens/auth_screen.dart';
import 'package:JC/screens/parents_mode_screen.dart';


class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  createAlertDialog(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text('Parents mode'),
      content: Text(' فى هذا المود يسمح للوالدين اختيار القصة ليشاهدها الطفل دون الاجبار على اجتياز المراحل السابقة'),
    );
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alertDialog;
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            
        RaisedButton(
          child: Text('important message'),
          onPressed: () {
              createAlertDialog(context);
          },
        ),
        RaisedButton(
          child: Text('Select Language'),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(ParentsMode.routeName);
          },
        ),
        RaisedButton(
          child: Text('log out'),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
          },
        ),
          ]
          ),
      ),
    );
  }
}