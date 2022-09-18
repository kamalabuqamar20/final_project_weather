import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


import '../../model/current_weather_data.dart';
import '../../provider/provider_view.dart';
import '../constant/images.dart';
import '../controler/home_controler.dart';
import '../model/model_view.dart';




class MyListWeatherView extends GetView<HomeController> {
  Model model;
MyListWeatherView(this.model);
  @override
  Widget build(BuildContext context) {
    
    
    return ListView.separated(
      shrinkWrap:  true,

      physics: NeverScrollableScrollPhysics(),
     // scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) {
        return  Column(
          children: [
            VerticalDivider(
                color: Colors.transparent,
                width: 5,
              ),
              SizedBox(height: 15,)
          ],
        );},
      itemCount: controller.dataList.length,//
      itemBuilder: (context, index) {
        CurrentWeatherData? data;
        (controller.dataList.length > 0)
            ? data = controller.dataList[index]
            : data = null;
        return Container(
          width: 140,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                /*  mainAxisAlignment:
                  MainAxisAlignment.center,*/
                  children: <Widget>[
                 
                        InkWell(
                          onTap: (){
                       Provider.of<DbProvider>(context,listen: true).deleatOneTask( model);

                          },
                          child: Icon(Icons.delete_outline,color: Colors.black45,)),
                   
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (data != null)
                              ? '${data.name}'
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(
                            fontSize: 25,//18
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'flutterfonts',
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          (data != null)
                              ? '${(data.main!.temp !- 273.15).round().toString()}\u2103'
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'flutterfonts',
                          ),
                        ),
                      ],
                    ),
                   // SizedBox(width: 60,),
                   Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: LottieBuilder.asset(
                              Images.cloudyAnim),
                        ),
                        Text(
                          (data != null)
                              ? '${data.weather![0].description}'
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(
                            color: Colors.black45,
                            fontFamily: 'flutterfonts',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}