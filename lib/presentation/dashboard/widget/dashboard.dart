import 'package:finance_digest/model/news.dart';
import 'package:finance_digest/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/custom_image_view.dart';
import 'package:finance_digest/widget/image_constant.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class Dashboard extends StatelessWidget {
  final News news;
  Dashboard({required this.news});

  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    String formatDate(int timestamp) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      return DateFormat('d MMMM yyyy')
          .format(date)
          .toUpperCase(); // E.g., '12 JUNE 2021'
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: CustomImageView(
                url: news.image,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextCustom(
                            text: news.source,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorConstant.whiteScreen,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            isTitle: true,
                            isFonts: 'Rubik',
                          ),
                        ),
                        const SizedBox(width: 50),
                        SizedBox(
                          width: 100,
                          child: TextCustom(
                            text: formatDate(news.datetime),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            textAlign: TextAlign.left,
                            color: ColorConstant.whiteScreen,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            isTitle: true,
                            isFonts: 'Rubik',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Link(
                      uri: Uri.parse(news.url),
                      builder: (context, followLink) {
                        return InkWell(
                          onTap: followLink,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 72,
                              maxWidth: 260,
                            ),
                            child: TextCustom(
                              text: news.summary,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              textAlign: TextAlign.left,
                              color: ColorConstant.whiteScreen,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
