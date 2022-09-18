import 'package:get/get_state_manager/get_state_manager.dart';
import '../data/sq_helper.dart';
import '../serves/weather_service.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';


class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData ?currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
 // HomeController.fromjson(List<Model> list);

  HomeController({required this.city});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
          print(error),
          update(),
        });
  }
 

  void getTopFiveCities()async {
   // Provider.of<DbProvider>(context)!.task;
  List<Map<String, Object?>> oo =await SqHeleper.sqHeleper.selectAllData();
  List<dynamic> list =oo.map((e) => e['title']).toList();
  
    List<dynamic> cities = [//String
      'gaza',
      'cairo',
      'palestine',
      'dubai',
      'new york',
    
      
    ];
   // cities.add('gaza');
    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }
}