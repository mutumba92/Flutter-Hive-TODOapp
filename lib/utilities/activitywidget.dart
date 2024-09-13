import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityWidget extends StatelessWidget {

  final String activity;
  final String time;
  final bool completed;
  VoidCallback isCompleted;
  VoidCallback isDeleted;
  // Function(BuildContext)? deleteTask;
  

  ActivityWidget({super.key, required this.activity, required this.completed, required this.time, required this.isCompleted, required this.isDeleted});

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.only(left: 20, right: 20.0, top: 20.0),
      child: Container(
        height: 200,
        decoration: completed ? BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(12.0)) : BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.0)) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(activity, 
            style: TextStyle(
              fontSize: 25.0, 
              fontWeight: FontWeight.bold
            ),
          ), 
          const SizedBox(height: 10.0,),
          
           Text(time, 
          style: TextStyle(
              fontSize: 20.0, 
              fontWeight: FontWeight.bold
            ),
            
          ), 
           const SizedBox(height: 25.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton.icon(onPressed: isCompleted, 
              
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 30, 83, 174))
              ),
              icon: const Icon(Icons.done, color: Colors.white, size: 25.0,), label: completed ? const Text("Un Do", style: TextStyle(color: Colors.white),): const Text("Done", style: TextStyle(color: Colors.white),)
              ),
              const SizedBox(
                width: 16.0,
                
              ),
              TextButton.icon(onPressed: isDeleted, 
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 30, 83, 174))
              ),
              icon: const Icon(Icons.delete, color: Colors.white,), label: const Text("Delete", 
              style: TextStyle(
                color: Colors.white
              ),
              ), 
              
                
                ),
            ],
          )
        ],),
      ),
    );
  }
}