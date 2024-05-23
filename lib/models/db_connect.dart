import 'package:http/http.dart' as http;
import './question_model.dart';
import 'dart:convert';

class DBconnect {
  //create a function to add a question to our database
  //declare the name of the table you what to create and add .json as suffix

  final url = Uri.parse('https://quizapp-94a25-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async{
    http.post(url, body: json.encode({
      'title': question.title,
      'options': question.options,
    }));
  }

  //fetch data from database
  Future<void> fetchQuestions() async{
    //we got the data from just using this. now let us print it to see whe we got
    http.get(url).then((response) {
      //the 'then' method returns a 'response' which is our data.
      var data = json.decode(response.body); 
      print(data);
    });
  }
}