import 'package:flutter/material.dart';
void main() {
  runApp(Todo());
}
class Todo extends StatefulWidget{
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  int i =0;
  TextEditingController tec=new TextEditingController();
  String va='';
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
            ListView.builder(
               itemCount: tasks.length,
               itemBuilder: ((context, index) {
                 return SizedBox(
                  height: 50,width: 50,child: Card( color: Colors.white,child: Text("${tasks[index]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),),
                 );
               }),
             ),
            Card(
              
               child: Align(alignment: Alignment.bottomCenter,child:TextFormField(
                 controller: tec,
               decoration: InputDecoration(
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



