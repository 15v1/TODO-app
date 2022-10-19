import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(Todo());
}
class Todo extends StatefulWidget{
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController tec=new TextEditingController();
  List<String>tasks=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness:Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('ToDo Tasks'),centerTitle: true,),
        
        body:PageView(
          children:[
            
            GridView.builder(
               itemCount: tasks.length,
               
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 3),
               itemBuilder: ((context, index) {
                 return SizedBox(
                  height: 20,width: 30,child: Card( color: Colors.primaries[Random().nextInt(Colors.primaries.length)],child: Text("${tasks[index]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),),
                 );
               }),
             ),
            Card(
              
               child: Align(alignment: Alignment.bottomCenter,child:TextFormField(
                 controller: tec,
               decoration: const InputDecoration(
                 hintText: 'Write Your Tasks'
               ),
               onEditingComplete: () {
                 setState(() {
                  print(tasks);
                    
                   tasks.add(tec.text);
                   tec.clear();
                 });
               },
             ),),
             ),
             
          
          ]
        )
        )
    );
  }
}






