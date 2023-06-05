import 'package:assignment/components/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/helpers/colors.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final dcontroller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller, required this.dcontroller,required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: blr,
      content: Container(
        height:300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
 //get user title
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Title', border: OutlineInputBorder()),
            ),

   //get user describtion
            TextField(
              controller: dcontroller,
              decoration: InputDecoration(
                  hintText: 'Description', border: OutlineInputBorder()),
            ),

//button = save+cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
//save button
                  MyButton(
                    text: 'Save', 
                    onPressed: onSave),
//cancle button
                 
                  MyButton(
                    text: 'Cancel', 
                    onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
