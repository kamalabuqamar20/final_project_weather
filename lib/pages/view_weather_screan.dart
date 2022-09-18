import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_view.dart';
import '../widget/add_weather.dart';
import '../widget/view_weather.dart';
import 'home/home_screen.dart';


class ViewWeatherScrean extends StatefulWidget {
  // ViewWeatherScrean({Key? key}) : super(key: key);

  @override
  State<ViewWeatherScrean> createState() => _ViewWeatherScreanState();
}

class _ViewWeatherScreanState extends State<ViewWeatherScrean> {
  bool itTaksData=false;
  @override
  Widget build(BuildContext context) {
    !itTaksData?Timer(Duration(milliseconds:1),(){
      setState(() {
        Provider.of<DbProvider>(context).selectAllTaskProvider();
        itTaksData=true;
      });

    }):null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 25,
        title: Text(
          'Add Location',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black45),
        ),
        actions: [
          IconButton(
              onPressed: () async{

                Navigator.pop(context);
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));

              },
              icon: Icon(
                Icons.search,
                color: Colors.black45,
              ))
        ],
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: Provider.of<DbProvider>(context).task.length, //
            itemBuilder: (context, index) {
              return Container(
                  child: MyListWeatherView(
                      Provider.of<DbProvider>(context).task[index]));
            },
          ),
          //MyListWeatherView() ,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {



          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddWeatherScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.black45, //Colors.indigo[400]
        child: const Icon(Icons.add),
      ),
    );
  }
}