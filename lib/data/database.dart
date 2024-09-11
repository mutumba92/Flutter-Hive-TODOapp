import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoLList = [];

  // refe box 
  final _mybox = Hive.box('mybox');


  // first time running app initial data
  void createInitialData(){
    toDoLList = [
          ["Make tutoral", false],
          ["Do Exercise", false]
        ];
  }

  // load data from database
  void loadData(){
      toDoLList = _mybox.get('TODOLIST');

  }

  // update the database
  void updateData(){
    _mybox.put("TODOLIST", toDoLList); 
  }


  
}