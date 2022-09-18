import 'package:flutter/material.dart';

import '../data/sq_helper.dart';


class Model{
  int? id ;
  String? title;
// late String image  ;
  Model( this.title);
  Model.fromMap(Map<String,dynamic> map){
    id = map[SqHeleper.idColumn];
   title = map[ SqHeleper.titleColumn] ;
 //  image = map[SqHeleper.isimageColumn];
  }
  Map<String , dynamic>toMap(){
    return {
      SqHeleper.titleColumn:title,
     // SqHeleper.isimageColumn:image,
    };
  }
}