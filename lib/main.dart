import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


import 'binding.dart';
import 'data/sq_helper.dart';
import 'pages/home/home_screen.dart';
import 'pages/view_weather_screan.dart';

import 'provider/provider_view.dart';

void main(context)async {
   WidgetsFlutterBinding.ensureInitialized();
   DbProvider();

   await SqHeleper.sqHeleper.initDatabase1();


  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<DbProvider>(
      create: (context){
        return DbProvider();
      } ,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
        /*  GetPage(
            name: '/',//'/'
            page: () => ViewWeatherScrean(),
            binding: HomeBinding(),
          ),*/
        GetPage(
            name: '/',
            page: () {
              return HomeScreen();
            },
            binding: HomeBinding(),
          ),
           
        ],
      ),
    );
      
      
      /*MaterialApp(
        home: ViewWeatherScrean(),
      ),
    );*/
      
      
      
      /* */
    
    /* ChangeNotifierProvider<DbProvider>(
      create: (context){
        return DbProvider();
      } ,
      child:*/
    
    
    /**/
    
    
    
    
    /**/
    
    
    
    
     
  }
}