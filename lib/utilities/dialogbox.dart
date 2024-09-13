import 'package:flutter/material.dart';


class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onOptionNo;
  VoidCallback onOptionYes;
  

  DialogBox({super.key, required this.onOptionNo, required this.onOptionYes, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 30, 83, 174),
      content: Container(
        height: 250,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Add Event To Your Day",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white
            ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                
                border: OutlineInputBorder()
              ),
            ),
             SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(onPressed: onOptionNo, icon: Icon(Icons.cancel), label: Text("Cancel"), style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)
                ),),
                TextButton.icon(onPressed: onOptionYes, icon: Icon(Icons.thumb_up), label: Text("Save"), style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)
                ),)
              ],
            )
          ],
        ),
      ),
      
    );
  }
}