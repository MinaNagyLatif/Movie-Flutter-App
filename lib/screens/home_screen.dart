import 'package:flutter/material.dart';
import 'package:JC/screens/exam_screen.dart';
import 'package:JC/widgets/cards.dart';
import 'package:JC/widgets/my_drawer.dart';
import 'dart:io';
var x;
class HomeScreen extends StatelessWidget {
 cardContent(x){
   
 }
  static const routeName = '/home';
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('اولاد يسوع'),
        actions: [
          IconButton(
          icon: Icon(Icons.search), 
          onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          }
          )
        ],
      ),
      body:
  
        ListView(
          
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height *0.1,
              margin: new EdgeInsets.all(25),
              child: Center(child: 
              Text('مغامرة فى الكتاب القدس',
               style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  ),
               )
              ),
            ),
            CardContent(title: 'الخليقة',x: 1,),
            CardContent(title: 'الابن الضال',x: 2 ,),
            CardContent(title: 'السامرى',x: 3,),
            CardContent(title: 'الميلاد', x: 4,),
            CardContent(title: 'نوح', x: 5,),
            
          ],
        ),
      
                
    );
    
  }
}

class DataSearch extends SearchDelegate<String>{
  DataSearch({
    String hintText = "search",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  final lessons =  ["الابن_الضال","السامرى_الصالح","الخليقة", "القيامة","نوح","الميلاد"];
  final sug = ['الابن الضال'];
  @override
  List<Widget> buildActions(BuildContext context) {
      return[
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = '';
          })
          ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, progress: transitionAnimation), 
        onPressed: (){
          close(context, null);
        } 
      ); 
    }
  
    @override
    Widget buildResults(BuildContext context) {
      if (query == 'الابن_الضال') {
        return CardContent(title: 'الابن الضال',x: 2 ,);
      }else if (query == 'السامرى_الصالح' ){
        return CardContent(title: 'السامرى',x: 3,);
      }else if (query == 'الخليقة' ){
        return CardContent(title: 'الخليقة',x: 1,);
      }else if (query == 'نوح' ){
        return CardContent(title: 'نوح', x: 5,);
      }else if (query == 'الميلاد' ){
        return CardContent(title: 'الميلاد', x: 4,);
      }else{
        return Center(
          child: Container(
            padding: new EdgeInsets.all(8),
            child: Text('يرجى كتابة اسم الدرس كامل كما هو موضح بالاختيارات', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            ),
          ),
        );
      }
      
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      final suggest = lessons.where((element) => element.startsWith(query)).toList();
      

      return ListView.builder(
        itemCount: suggest.length,
        itemBuilder: (context,index) =>ListTile(
          onTap: (){
            query = suggest[index];
            showResults(context);
          },
          leading: Icon(Icons.book),
          title: Text(suggest[index])
        ),
        );
  }

}