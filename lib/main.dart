import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.purple ,
        appBar: AppBar(
          title: Text(' Tone Cruscade'), //Tone Cruscade
          centerTitle: true, //titleSpacing
          leading: IconButton(
            icon: Icon(Icons.add_sharp),
            onPressed: () {},
          ),
          actions: [ // the code of the extraxct

            IconButton(
              icon: Icon(Icons.notification_add),onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.search),onPressed: (){},
            )
          ],
         elevation: 25,
         flexibleSpace:Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.purple],)),) ,
        ),
        body :
         Container(
            //child:Image(image:NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),),
             decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.purple.shade300,Colors.pinkAccent.shade100,Colors.deepOrange.shade200,Colors.deepOrangeAccent.shade100,Colors.purple.shade300],
           // stops:[0.1,0.4,0.5,0.8,1],
            begin: Alignment.topRight,
        end:Alignment.bottomLeft))),


      ),
    ),
  );
}
