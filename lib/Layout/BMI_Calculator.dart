

import 'dart:math';

import 'package:calculator/modules/BmiResult.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool IsMale = true;
  double height = 120;
  int weight = 60;
  int age = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(.5),
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(.5),
        elevation: 0.0,
        title: Container(
            width: double.infinity,
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
      ),


      body: Column(

        children: [
          Expanded(
              child:

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){setState(() {
                        IsMale =true;
                      });},
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/image/male1.png',),width: 100,height: 100,),
                            Text('Male',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),)

                          ],),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: IsMale? Colors.blue:Colors.grey.withOpacity(.10)),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),

                  Expanded(
                    child: GestureDetector(
                      onTap: (){setState(() {
                        IsMale =false ;
                      });},
                      child: Container(

                        child: Column
                          (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/image/fmale.png',),width: 110,height: 110,),
                            Text('Femal',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),)

                          ],),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: !IsMale? Colors.blue:Colors.grey.withOpacity(.10)),
                      ),
                    ),
                  )



                ],),
              )),
          //////////////////////////////////////


          Expanded(child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline:TextBaseline.alphabetic,
                    children: [
                      Text("${height.round()}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                      Text("cm",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)


                    ],),
                  Slider(value: height,
                      max: 250,
                      min: 50,

                      onChanged: (value)
                      {setState(() {
                        height=value;
                      });
                      print(value.round());})



                ],),

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
            ),
          )),
          //////////////////////////////////////////////////////
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weight',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),
                            Text('${weight}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 44,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){setState(() {
                                  weight++;
                                });},
                                  heroTag: "weight+",
                                  child: Icon(Icons.add),mini: true,
                                ),
                                SizedBox(width: 15,),
                                FloatingActionButton(onPressed: (){setState(() {
                                  weight--;
                                });},
                                  heroTag: "weight-",
                                  child: Icon(Icons.remove),mini: true,
                                )


                              ],)


                          ],),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),
                            Text('${age}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 44,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){setState(() {
                                  age++;
                                });},
                                  heroTag: "age+",
                                  child: Icon(Icons.add),mini: true,
                                ),
                                SizedBox(width: 15,),
                                FloatingActionButton(onPressed: (){setState(() {
                                  age--;
                                });
                                },
                                  heroTag: "age-",
                                  child: Icon(Icons.remove),mini: true,
                                )


                              ],)


                          ],),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
                      ),
                    ),




                  ],),
              )),
          ////////////////////////////////////////////////
          Container(
            color: Colors.green.withOpacity(.5),
            width: double.infinity,
            height: 60,
            child: MaterialButton(
              onPressed: (){
                double  result = weight /pow(height /100,2);
                print(result.round());
                Navigator.push
                  (context,
                    MaterialPageRoute(
                      builder: (context)=> BmiResult(result: result.round(), age: age,IsMale: IsMale, ),
                    )
                );
              },
              child:
              Text('CALCULATER',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),),
          )





        ],),


    );
  }
}
