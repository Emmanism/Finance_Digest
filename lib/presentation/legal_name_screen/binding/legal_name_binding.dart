
import 'package:finance_digest/presentation/legal_name_screen/controller/legal_name_controller.dart';
import 'package:get/get.dart';

class LegalNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LegalNameController());
  }
}
