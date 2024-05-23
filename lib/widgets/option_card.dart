import 'package:flutter/material.dart';
// ignore: unused_import
import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key,
   required this.option, 
   required this.color, 
   
}
  );

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lime,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            color: color.red != color.green ? color: Colors.lime,
            
          ),
          ),
      ),
    );
  }
}
//add the option card to the home screen