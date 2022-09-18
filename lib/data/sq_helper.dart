import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import '../model/model_view.dart';

class SqHeleper{
  SqHeleper._();
 static SqHeleper sqHeleper = SqHeleper._();
late  Database _database ;
static String tableName = 'ToDo';
static String idColumn = 'id';
static String titleColumn = 'title';
static String isCompletColumn = 'complet';

/*Future<Database?> get db async{
if(_database == null){
_database =await initDataBase();
  return _database;
}
else{
  return _database;
}
}*/
initDatabase1()async{
  _database =await initDataBase();
}

 Future<Database> initDataBase()async{
 String path = await getDatabasesPath();
 String fullPath = join(path,'todo.db');
Future<Database> myData= openDatabase(fullPath,version: 1,onCreate: _onCreate);
return myData;
}
_onCreate(Database data,int version)async{
data.execute('''
CREATE TABLE $tableName (
  $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
   $titleColumn TEXT,
    $isCompletColumn INTEGER)
 
''');
log('on creat');
}
insertData(Model model)async{
//Database? myData = await db;
_database.insert(tableName, model.toMap());
//myData!
}
Future<List <Map<String, Object?>> >selectAllData()async{
 // Database? myData = await db;
 List<Map<String, Object?>> select =await _database.query(tableName);
 //List <Model> listSelect =select.map((e) => Model.fromMap(e)).toList();
 return select;//listSelect
 
}
Future<List <Model> >selectAllDataPtovider()async{
 // Database? myData = await db;
 List<Map<String, Object?>> select =await _database.query(tableName);
 List <Model> listSelect =select.map((e) => Model.fromMap(e)).toList();
 return listSelect;
 
}
selectOneData(int id)async{
 // Database? myData=await db;
  _database.query(
    tableName,
    where: '$idColumn=?',
    whereArgs: [id],
    ) ;
}
updataOneData(Model model)async{
 // Database? myData=await db;
 // model.isComplet=!model.isComplet;
  _database.update(
    tableName, 
    model.toMap(),
    where: '$idColumn=?',
    whereArgs: [model.id],
    );
}
delateOneData(int id)async{
  // Database? myData=await db;
   _database.delete(tableName,where: '$idColumn=?',whereArgs: [id]);
}
}