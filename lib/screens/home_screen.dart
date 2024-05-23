//import the material .dart
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';//our question model
import '../constants.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';

//create the home screen widget
// use state full widget because all its the parent widget and all the functions and variables will be in this widget so we will need to change the state of our widget.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// ignore: unused_field, prefer_final_fields
List<Question> _questions = [
  Question(
    id: '10', 
    title: 'Name any one means of transport.', 
    options: {'cat': false, 'boat': true, 'plate': false, 'cup': false,}
   ),
   Question(
    id: '11', 
    title: 'What does red color mean on the trafic light?', 
    options: {'Go': false, 'Sotp': false, 'over take': false, 'stop': true}
   ),

    Question(
    id: '12', 
    title: 'Name the items we make for playing.', 
    options: {'ball': true, 'fire': false, 'boy': false, 'hot water': false}
   ),

     Question(
    id: '13', 
    title: 'Give one way of conserving or protecting the environment.', 
    options: {'Overgrazing': false, 'cutting trees': false, 'bush burning': false,'mulching': true,}
   ),

     Question(
    id: '14', 
    title: '_________is the state of being safe from danger.', 
    options: {'insecurity': false, 'fight': false,  'peace': false, 'security': true,}
   ),

     Question(
    id: '15', 
    title: 'Give one cause of insecurity in our homes.', 
    options: {'Love': false, 'Trespassing': true,'Care': false, 'Peace': false}
   ),

     Question(
    id: '16', 
    title: 'Name any one person who keeps peace at home.', 
    options: {'Thief': false, 'Rat': false, 'Cat': false, 'Father': true,}
   ),

     Question(
    id: '17', 
    title: 'A person who lives near you is called a?', 
    options: {'Teacher': false, 'Child': false, 'Neighbour': true, 'Samaritan': false}
   ),

     Question(
    id: '18', 
    title: 'Name any one component of the environment.', 
    options: {'Television': false, 'Cup': false,  'Chair': false, 'Trees': true,}
   ),

     Question(
    id: '19', 
    title: 'Name two examples of seeds.', 
    options: {'box': false, 'water': false, 'bean': true, 'book': false}
   ),

     Question(
    id: '20', 
    title: 'Name the young one of a cat', 
    options: {'kitten': true,'dog': false, 'kid': false, 'calf': false}
   ),

];


//create an index to loop through _ question
  int index = 0;

  //create a score variable
   int score = 0;
  //create a boolean value to check if the user has clicked
  bool isPressed = false;

  //create the function to display the next question
  bool isAlreadySelected = false;

  void nextQuestion() {
    if(index == _questions.length -1){
      //this is the block where the question end.
      showDialog(
        context: context,
         barrierDismissible: false,//this will disable the dismiss function on clicking outside of box
        builder:(ctx) => ResultBox(
            result: score, // total points the user got
            questionLength: _questions.length,//out of how many questions
            onPressed: startOver,
      )
      );
      
    }else{
      if(isPressed){
        setState(() {
     index++;
     isPressed = false;
     isAlreadySelected = false;
   }); 
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select any option'), 
        behavior: SnackBarBehavior.floating, 
        margin: EdgeInsets.symmetric(vertical: 20.0),
        )
      );
    }
   
  }
  }
  //create a function for changing color
  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;

    }else{
      if(value == true){
      score++;
      }
        setState(() {
      isPressed = true;
      isAlreadySelected = true;
    });
    
    
    }
    
  }
  
  //create a function to start over
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: const Color.fromARGB(255, 93, 88, 163),
        shadowColor: Colors.white,
        actions: [
          Padding(padding: const EdgeInsets.all(18.0),
           child: Text('score: $score',
           style: const TextStyle(fontSize: 18.0),
           ),
          ),
        ],

      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            //add the questionWidget here
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,//means the first question in the list 
              totalQuestions: _questions.length,//total length of the list
              ),
              const Divider(color: neutral),
              //add some space
              const SizedBox(height: 25.0),
              for(int i=0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                  _questions[index].options.values.toList()[i],
                  ),
                  
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  
                  color: isPressed
                  // ignore: unrelated_type_equality_checks
                   ? _questions[index].options.values.toList()[i] == true
                       ? correct
                       : incorrect 
                   : neutral,
                      
                  ),
              ),
                
          ],
        ),
      ),

      //use the floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//import this file in the main.dart

