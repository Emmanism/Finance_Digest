import 'package:finance_digest/presentation/legal_name_screen/binding/legal_name_binding.dart';
import 'package:finance_digest/presentation/legal_name_screen/legal_name_screen.dart';
import 'package:finance_digest/presentation/splash_screen/binding/splash_binding.dart';
import 'package:finance_digest/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String legalNameScereen = '/legal_name_screen';


  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: legalNameScereen,
     page: () => LegalNameScreen(),
     bindings: [
       LegalNameBinding(),
      ],
   ),
    
   GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
     ],
    )
  ];
}
