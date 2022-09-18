/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_view.dart';
import '../provider/provider_view.dart';
class WeatherWidget extends StatelessWidget {
// List< Model>? list;
  Model? model ;
 WeatherWidget(this.model);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
        IconButton(
          onPressed: (){
            Provider.of<DbProvider>(context,listen: false).deleatOneTask(model!);
          },
           icon:const Icon(Icons.delete) ,
           ),
        const   SizedBox(width: 10,),
           Text( model!.title??'',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        const Spacer(),
       
        ],
      ),
    );
  }
}*/