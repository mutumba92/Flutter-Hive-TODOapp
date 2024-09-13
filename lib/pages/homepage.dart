import 'package:dayplanner/utilities/activitywidget.dart';
import 'package:dayplanner/utilities/dialogbox.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

List activities = [

["Wake Up", true, "8:00"],
["Gym", false, "10:00"],
["Clean Up", false, "1:00"],
["Party", false, "21:00"],

];

void _isCompleted(index){
    setState(() {
      activities[index][1] = !activities[index][1];
    });
}


void _onOptionNo(){

}

void _onOptionYes(){
  setState(() {
    activities.add([_controller.text, true, "6:00"]);
    _controller.clear();
  });
}



void _isDeleted(index){

  
  setState(() {
    activities.removeAt(index);
  });
}

void createNewTask(){
  showDialog(context: context, builder: (contex){
      return DialogBox(onOptionNo: () => Navigator.of(context).pop(), onOptionYes: _onOptionYes, controller: _controller);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Day Planner", 
          style: TextStyle(
            color: Colors.white
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 30, 83, 174),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Color.fromARGB(255, 30, 83, 174),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index){
            return ActivityWidget(activity: activities[index][0], completed: activities[index][1], time: activities[index][2], isCompleted: () => _isCompleted(index), isDeleted: () => _isDeleted(index),);
      })

    );
  }
}