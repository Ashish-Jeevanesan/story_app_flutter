import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'StoryBrain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/111.jpg'),
              fit: BoxFit.cover,

            ),
          ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY:5.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Bandersnatch(),
          ),
        ),

        padding: EdgeInsets.symmetric(vertical:50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
       // child: Bandersnatch(),
        // backgroundColor: Colors.blue[900],
        // body: SafeArea(
        //   child: Padding(
        //     padding:EdgeInsets.symmetric(horizontal: 10.0),
        //     child: Bandersnatch(),
        //   ),
        // ),
        ),
      ),
    );
  }
}

class Bandersnatch extends StatefulWidget {
  const Bandersnatch({Key key}) : super(key: key);

  @override
  _BandersnatchState createState() => _BandersnatchState();
}

class _BandersnatchState extends State<Bandersnatch> {

  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child:Center(
              child: Text( storyBrain.getStory() , textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
              )
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom (
                primary: Colors.white,
                backgroundColor: Colors.red),
            child: Text(storyBrain.getchoice1(),
              style: TextStyle(
                color:Colors.white,
                fontSize: 20.0,
              ),
              ),
              onPressed: (){
                setState(() {
                  storyBrain.nextStory(1);
                });


              },
            ),
          ),
        ),
        Expanded(
          child:Padding(
            padding: EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                ),

              child: Text(storyBrain.getchoice2(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,

                ),

                ),
                onPressed:(){
                  setState(() {
                    storyBrain.nextStory(2);
                  });

                },
              ),
          ),
        ),

        Row()
      ],
    );
  }
}

