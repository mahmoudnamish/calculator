


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int result;
  final bool IsMale;
  final int age;

  BmiResult({
    required this.result,
    required this.IsMale,
    required this.age,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(.5),

      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(.5),
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
            Navigator.pop(context);
      },),
      title: Text('BMI Result'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender:${IsMale?'male':'Female' }'
              ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            Text('Age:$age',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            Text('Result:$result',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)

          ],),
      ),
    );
  }
}
