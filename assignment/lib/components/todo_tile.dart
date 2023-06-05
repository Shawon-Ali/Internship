import 'package:assignment/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
 
  final String taskName;
  final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function (BuildContext)?deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskDescription,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane:ActionPane(
          motion:StretchMotion() , 
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red, )
          ]) ,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               color: mclr),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.deepPurple,
                ),
             Wrap(
              direction: Axis.vertical,
                children: [

                  Text(taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    :TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  ),

                  Wrap(
                    children:[ Text(taskDescription,
                    style: TextStyle(
                      fontSize: 15
                    ),),]
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
