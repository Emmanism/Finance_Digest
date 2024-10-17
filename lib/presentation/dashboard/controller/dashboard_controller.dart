import 'package:finance_digest/apiclient/apiclient.dart';
import 'package:finance_digest/model/news.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isLoadMore = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  var news = <News>[].obs;
  final RxBool isError = false.obs;
  final ScrollController scrollController = ScrollController();

  Rx<News?> postModelObj = Rx<News?>(null);
  var error = ''.obs;
  final apiClient = ApiClient();
  int total = 1000;
  int currentPage = 1;
  int limit = 10;
  Rx<bool> isLastPage = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
    scrollController.addListener(loadMoreNews);
  }


  Future<void> loadMoreNews() async {
    print('get more data');
     //isLoadMore.value = true;
     print("User is near the bottom, loading more news...");
     if (isLoadMore.value && isLastPage.value) return;
    currentPage = currentPage + 1;
    fetchNews(loadMore: true);
  }

  

  void fetchNews({bool loadMore = false}) async {
    if (isLoading.value || isLoadMore.value) return;

    if (loadMore) {
      isLoadMore.value = true;
      currentPage += 1;
    } else {
      isLoading.value = true;
      currentPage = 1;
    }

    try {
      error('');
      final response = await apiClient.fetchNews(currentPage, limit);

      if (response.statusCode == 200) {
        List<dynamic> newsJson = response.body;

        if (newsJson.isEmpty) {
          isLastPage.value = true;
          error('No News available');
          news.clear();
        } else {
          if (loadMore) {
            isError.value = false;
            news.addAll(newsJson.map((json) => News.fromJson(json)).toList());
          } else {
            news.value = newsJson.map((json) => News.fromJson(json)).toList();
          }
        }
      } else {
        error('Failed to fetch news. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      error("An error occurred: $e");
      isError(true);
    } finally {
      isLoading(false);
      isLoadMore(false);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    print('Could not launch $url');
  }
}
