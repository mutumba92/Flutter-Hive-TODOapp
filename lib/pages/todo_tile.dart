import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';



class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDoTile({super.key, required this.taskCompleted, required this.onChanged, required this.taskName, required this.deleteTask});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask, icon: Icons.delete, backgroundColor: Colors.red,)
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              //check box
              Checkbox(value:taskCompleted, onChanged: onChanged,
              activeColor: Colors.black,
              ),
              Text(taskName,
              style: TextStyle(
        
                
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
              ),
              
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12.0)
          ),
        ),
      ),
    );
  }
}