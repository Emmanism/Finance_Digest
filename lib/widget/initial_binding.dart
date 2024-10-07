import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finance_digest/apiclient/apiclient.dart';
import 'package:finance_digest/utill/network_info.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
     Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
