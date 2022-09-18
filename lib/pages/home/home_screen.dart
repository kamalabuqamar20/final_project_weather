import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../constant/images.dart';
import '../../controler/home_controler.dart';
import '../../widget/myList.dart';
import '../../widget/my_chart.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed: (){
      //     Navigator.pop(context);
      //   }, icon: Icon(Icons.arrow_back,color: Colors.black45,)),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          // return Container();
          return ListView(
            children: <Widget>[
              Container(
               height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter:
                    ColorFilter.mode(Colors.black38, BlendMode.darken),
                    image: AssetImage(
                      'assets/images/cloud-in-blue-sky.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                /*   Container(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),*/
                    //TODO
                    Container(
                      padding: EdgeInsets.only(top: 50, left: 20, right: 10),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          print(value);
                          controller.updateWeather();
                        },
                        decoration: InputDecoration(
                          suffix: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 175,
                      child: Align(
                        alignment: Alignment(0.0, 1.0),
                        child: SizedBox(
                          height: 50,
                          width: 10,
                          child: OverflowBox(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 0.0,
                            maxHeight: (MediaQuery.of(context).size.height / 3),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                 // height: double.infinity,
                                // height: 260,

                                  child: Card(

                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child:  controller.currentWeatherData!.wind!=null?Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        //TODO
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 5, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  '${controller.currentWeatherData!.name}'
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 24,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 16,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        //TODO
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(left:25),
                                              child: Column(
                                                children: <Widget>[
                                                  controller.currentWeatherData!.wind!=null?Text(
                                                    '${controller.currentWeatherData!.weather![0].description}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 22,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ):Container(),
                                                  SizedBox(height: 10),
                                                  controller.currentWeatherData!.wind!=null?Text(
                                                    '${(controller.currentWeatherData!.main!.temp! - 273.15).round().toString()}\u2103',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2!
                                                        .copyWith(
                                                        color: Colors.black45,
                                                        fontFamily:
                                                        'flutterfonts'),
                                                  ):Container(),
                                                  controller.currentWeatherData!.wind!=null?Text(
                                                    'min: ${(controller.currentWeatherData!.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData!.main!
                                                        .tempMax
                                                    !- 273.15).round().toString()}\u2103',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ):Container(),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 120,
                                                   // height: 120,
                                                   height: 100,
                                                    child: LottieBuilder.asset(
                                                        Images.cloudyAnim),
                                                  ),
                                                  Container(
                                                    child:controller.currentWeatherData!.wind!=null?Text(
                                                      'wind ${controller.currentWeatherData!.wind!.speed.toString()} m/s',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        // fontFamily:
                                                        // 'flutterfonts',
                                                      ),
                                                    ):Container(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ):Center(child: CircularProgressIndicator()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(

                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.only(top: 70),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'other city'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'flutterfonts',
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              MyList(),
                              SizedBox(height:20,),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'forcast next 5 days'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Icon(
                                      Icons.next_plan_outlined,
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height:20,),
                              MyChart(),
                              SizedBox(height: 70,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}