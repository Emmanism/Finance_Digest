import 'package:finance_digest/model/user_data.dart';
import 'package:finance_digest/presentation/legal_name_screen/legal_name_screen.dart';
import 'package:finance_digest/routes/app_routes.dart';
import 'package:finance_digest/presentation/splash_screen/splash_screen.dart';
import 'package:finance_digest/widget/initial_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
    SystemUiOverlay.top, 
  ]);



  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await Hive.initFlutter(); 

   Hive.registerAdapter(UserDataAdapter()); 

  await Hive.openBox<UserData>('userBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, widget) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Finance Digest',
            initialBinding: InitialBindings(),
            initialRoute: AppRoutes.initialRoute,
            getPages: AppRoutes.pages,
            home: widget,
          );
        });
  }
}
