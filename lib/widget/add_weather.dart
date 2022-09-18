import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/model_view.dart';
import '../../provider/provider_view.dart';


//import 'package:provider/provider.dart';

//import '../model/task_data.dart';
//import 'package:provider/provider.dart';
//import 'package:todaydo_app/models/task_data.dart';

class AddWeatherScreen extends StatelessWidget {
//  final Function addTaskCallback;

 // AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
  //  String? newTaskTitle;
  late String contect ='gaza';
    return Container(
      
      padding:const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         const Text('Add Weather',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,//indigo[400]
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              contect = newText;
            },
          ),
         const SizedBox(height: 30),
          TextButton(
            onPressed: ()async {
             Model model =Model( contect);/*,image: provider.seletedImage.toString()*/
             await Provider.of<DbProvider>(context,listen: false).insetOneTask(model);
             Navigator.pop(context);//contect
            },
            child: Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,//teal[400]
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}