import 'package:finance_digest/model/user_data.dart';
import 'package:finance_digest/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:finance_digest/presentation/dashboard/widget/dashboard.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/custom_image_view.dart';
import 'package:finance_digest/widget/image_constant.dart';
import 'package:finance_digest/widget/loader.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels ==
              controller.scrollController.position.maxScrollExtent &&
          !controller.isLastPage.value &&
          !controller.isLoadMore.value) {
        controller.loadMoreNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box<UserData>('userBox');

    UserData? userData = userBox.get('userData');

    return Scaffold(
      backgroundColor: ColorConstant.splash,
      appBar: AppBar(
        toolbarHeight: 181,
        backgroundColor: ColorConstant.appbarColor,
        title: Obx(() {
          return Column(
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
                  ? const SizedBox(height: 20)
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
        leadingWidth: 0,
      ),
      body: SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: Loader());
        } else if (controller.error.value.isNotEmpty) {
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
                            controller: controller.scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.isLoadMore.value
                                ? controller.news.length + 1
                                : controller.news.length,
                            itemBuilder: (context, index) {
                             /*     if (controller.isLoadMore.value)
                               Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SpinKitThreeBounce(
                                    color: ColorConstant.whiteScreen,
                                    size: 40,
                                  ),
                                );
                                */

                              // Render the normal news items
                              final news = controller.news[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Dashboard(
                                  news: news,
                                  controller: controller,
                                ),
                              );
                            },
                          ))
                    ],
                  )));
        }
      })),
    );
  }
}
