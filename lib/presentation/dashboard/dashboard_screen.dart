import 'package:finance_digest/model/user_data.dart';
import 'package:finance_digest/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:finance_digest/presentation/dashboard/widget/dashboard.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/custom_image_view.dart';
import 'package:finance_digest/widget/image_constant.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  DashboardController controller = Get.put(DashboardController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box<UserData>('userBox');

    UserData? userData = userBox.get('userData');
    
    return Scaffold(
        backgroundColor: ColorConstant.splash,
        appBar: AppBar(
          toolbarHeight: 181,
          backgroundColor: ColorConstant.appbarColor,
          title:Obx((){
            return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: 'Hey, ${userData?.firstName}',
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: ColorConstant.whiteScreen,
                isTitle: true,
                isFonts: 'Raleway',
              ),
                 controller.isError.value  
                 ? const  SizedBox(height: 20)
                 : const SizedBox.shrink(),
                 if (controller.isError.value && controller.error.isNotEmpty)
                   TextCustom(
                      text: 'Something went wrong. Please try again later.',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorConstant.whiteScreen,
                      isTitle: true,
                      isFonts: 'Rubik',
                    )
            ],
          );
          }),
          elevation: 0,
          leadingWidth: 5,
        ),
        body:  SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: CircularProgressIndicator());
        }  else if (controller.error.value.isNotEmpty) {
          return Container();
        } else {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Container(
                   width: double.maxFinite,
                   height: 900,
                   margin: const EdgeInsets.only(bottom: 20.0),
                                     child: ListView.builder(
                   physics: const BouncingScrollPhysics(),
                   itemCount: controller.isTrendLoading.value
                       ? 5
                       : controller.news.length,
                   itemBuilder: (context, index) {
                     final news = controller.news[index];
                     return Padding(
                       padding: const EdgeInsets.symmetric(
                            vertical: 10),
                       child: Dashboard(news:news),
                     );
                   },
                                      )),
                ],
              )));
        }
      })), 

  );
  }
}
