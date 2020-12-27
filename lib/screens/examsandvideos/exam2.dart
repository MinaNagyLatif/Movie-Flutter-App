import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/screens/home_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:path_provider/path_provider.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz{
  var images = [
    "alligator", "cat", "dog", "owl"
  ];


  var questions = [
    "مين عارف ياصحابي صحبنا دا كان عندو كام اخ",
    " مين عارف ياصحابي عارف صحبنا في القصه   ",
    "مين عارف ياصحابي صحبنا حصله ايه في الأخر خالص؟",
  ];


  var choices = [
    ["اتنين ", "واحد", "تلاته", "اربعه"],
    [" مزرعه خرفان", "مزرعه خنازير", "مزرعه فراخ", "مزرعه بقر"],
    ["فضل مع الخنازير", "مرجعش لباباه", "رجع لباباه", "مشي وراح بلد تانيه"]
  ];


  var correctAnswers = [
    "واحد",  "مزرعه خنازير", "رجع لباباه"
  ];
}

class Quiz2 extends StatefulWidget{

  
  
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz2> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),

                      new Text("Score: $finalScore",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),)
                    ],
                  ),
                ),


                //image
                

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    FittedBox(
                        child: new MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: (){
                          if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: new Text(quiz.choices[questionNumber][0],
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),),
                      ),
                    ),

                    //button 2
                    FittedBox(
                        child: new MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: (){

                          if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: new Text(quiz.choices[questionNumber][1],
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),),
                      ),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    FittedBox(
                        child: new MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: (){

                          if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: new Text(quiz.choices[questionNumber][2],
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),),
                      ),
                    ),

                    //button 4
                    FittedBox(
                        child: new MaterialButton(
                        minWidth: 120.0,
                        color: Colors.blueGrey,
                        onPressed: (){

                          if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        child: new Text(quiz.choices[questionNumber][3],
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),),
                      ),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child:  IconButton(
                    icon: Icon(Icons.speaker), 
                    onPressed: (){
                      if (questionNumber == 0) {
                        final player = AudioCache();
                        player.play('4.m4a');
                      }else if (questionNumber == 1){
                        final player = AudioCache();
                        player.play('6.m4a');
                      }else if (questionNumber == 2){
                        final player = AudioCache();
                        player.play('7.m4a');
                      }
                    })
                ),



              ],
            ),
          ),
      )
    );

  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}



class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: (){
            questionNumber = 0;
                  finalScore = 0;
            Navigator.of(context).pop();}),
        centerTitle: true,
        title: Text('اولاد يسوع'),
        actions: [
          RaisedButton(
            color: Colors.white,
            onPressed: () async{      
              questionNumber = 0;
                  finalScore = 0;
             Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            child: Text('Next'),)
        ],
        
      ),

        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("Final Score: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              
                   

            ],
            
          ),
          
        ),


      ),
    );
  }
}
