import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/pages/todo_tile.dart';
import 'package:todoapp/utilities/dialogBox.dart';
import 'package:hive_flutter/hive_flutter.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


      // reference the box
      final _mybox = Hive.box('mybox');
      ToDoDataBase db = ToDoDataBase();


      // text controller
      final _controller = TextEditingController();

      @override
  void initState() {
    
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      // there already exists data
      db.loadData();
    }


    super.initState();



  }

      // list of to do tasks

    // checkbox tapped
    void checkBoxChanged(bool? value, int index){
      setState(() {
        db.toDoLList[index][1]  = !db.toDoLList[index][1];
      });
      db.updateData();
      
    }

    void saveNewTask(){
      setState(() {
        db.toDoLList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateData();
    }

    void createNewTask(){
        showDialog(context: context, builder: (context){
          return DialogBox(

              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
          );
        });
    }


    void deleteTask(int index){
        setState(() {
          db.toDoLList.removeAt(index);
        });
        db.updateData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("TO DO"),
        elevation: 0.0,
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoLList.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskCompleted: db.toDoLList[index][1], onChanged: (value) => checkBoxChanged(value, index), taskName: db.toDoLList[index][0], deleteTask: (context)=> deleteTask(index),);
        },
      ),
    );
  }
}