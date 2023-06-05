// import 'package:firebase_core/firebase_core.dart';
import 'package:assignment/components/todo_tile.dart';
import 'package:assignment/helpers/colors.dart';
import 'package:assignment/components/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _controller= TextEditingController();
   final _dController= TextEditingController();

  

  //lis of to do task
  List toDoList = [
    ["Coding",false,"I have to Complete the apk"],
    ["Exercise",false,"I have to do Exercise "],
  ];


  //checkbox 
  void checkBoxChanged(bool? value, int index){
     setState(() {
       toDoList[index][1]=!toDoList[index][1];
     });
  }

//  

void deleteTask(int index){
setState(() {
  toDoList.removeAt(index);
});
}


void saveNewTask(){
  setState(() {
    toDoList.add([_controller.text,false,_dController.text]);
    _controller.clear();
   
  });
  Navigator.of(context).pop();
}

//create new task
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(
        dcontroller: _dController,
        controller: _controller,
        onSave: saveNewTask,
        onCancel:()=> Navigator.of(context).pop() ,
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: mclr,
        actions: [
          CircleAvatar(radius: 20,
         backgroundColor: Colors.white38,
                        
            child: PopupMenuButton(
              icon: Icon(Icons.person),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.deepPurple[200],
                        child: Icon(Icons.person)),
                      Text('' + user.email!),
                      TextButton.icon(onPressed:(){
                        FirebaseAuth.instance.signOut();
                      } , 
                      icon: Icon(Icons.logout), label: Text('logout'))
                    ],
                  )
                ),
              ],
              onSelected: (item) => {print(item)},
            ),
          ),
        ],
      ),
    

floatingActionButton: FloatingActionButton(
  backgroundColor: mclr,
  onPressed: createNewTask,
child: Icon(Icons.add),
),
backgroundColor: blr,
    body: ListView.builder(

      itemCount: toDoList.length,
      itemBuilder: (context, index) {
        return ToDoTile(
          
          taskName: toDoList[index][0],
          
          taskCompleted: toDoList[index][1], 
          taskDescription: toDoList[index][2], 
          onChanged: (value) => checkBoxChanged(value,index),
          deleteFunction: (context) => deleteTask(index) ,
          );
      
      },)
     
    
    );
  }
}
