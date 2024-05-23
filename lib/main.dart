import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home_screen.dart';// this is the file we create
import './models/db_connect.dart';

//run main method
void main() {
var db = DBconnect();
// db.addQuestion(
//   Question(id: '20', title: 'what is 20 x 10 ?', options: {
//     '100': false,
//      '20': false, 
//      '200': true,
//      '300': false,
//      } )
// );  
db.fetchQuestions();
// the run app method
  runApp(
    const MyApp(), //we will correct this below
  );
}

//create the MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //remove the debug banner
      debugShowCheckedModeBanner: false,

      //set the homepage
      home: HomeScreen(),//after create it in separate file
    );
  }
}
