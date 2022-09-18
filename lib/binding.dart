import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'controler/home_controler.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'gaza'));//'zagazig'

  }


}