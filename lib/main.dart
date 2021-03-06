
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/screens/auth_screen.dart';
import 'package:my_shop/screens/dual_screen.dart';
import 'package:my_shop/screens/english.dart';
import 'package:my_shop/screens/examsandvideos/dual2.dart';
import 'package:my_shop/screens/examsandvideos/duel3.dart';
import 'package:my_shop/screens/examsandvideos/duel5.dart';
import 'package:my_shop/screens/examsandvideos/duel6.dart';
import 'package:my_shop/screens/examsandvideos/duel7.dart';
import 'package:my_shop/screens/examsandvideos/yarab.dart';
import 'package:my_shop/screens/french.dart';
import 'package:my_shop/screens/parents_mode_screen.dart';
import 'package:my_shop/screens/home_screen.dart';
import 'package:my_shop/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          fontFamily: 'MontserratAlternates',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),//FutureBuilder(
            //future: _initialization,
            //builder: (context, snapshot) {
              //if (snapshot.connectionState == ConnectionState.waiting) {
                //return SplashScreen();
              //} else {
               //if (FirebaseAuth.instance.currentUser != null) {
                 // return HomeScreen();
                //} else {
                  //return AuthScreen();
               //}
              //}
            //}),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          AuthScreen.routeName: (context) => AuthScreen(),
          ParentsMode.routeName: (context) => ParentsMode(),
          AllContent.routeName: (context)=> AllContent(),
          AllContent2.routeName: (context)=> AllContent2(),
          AllContent3.routeName: (context)=> AllContent3(),
          AllContent4.routeName: (context)=> AllContent4(),
          AllContent5.routeName: (context)=> AllContent5(),
          English.routeName: (context) => English(),
          AllContent6.routeName: (context)=> AllContent6(),
          French.routeName: (context)=> French(),
          AllContent7.routeName: (context)=> AllContent7(),
          

        },
      ),
    );
  }
}