import 'package:finance_digest/apiclient/apiclient.dart';
import 'package:finance_digest/model/news.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  var news = <News>[].obs;
  final RxBool isError = false.obs;

  Rx<News?> postModelObj = Rx<News?>(null);
  var error = ''.obs;
  final apiClient = ApiClient();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      error('');
      isLoading.value = true;
      isError.value = false;

      final response = await apiClient.fetchNews();

      if (response.statusCode == 200) {
        isError.value = false;
        List<dynamic> newsJson = response.body;

        if (newsJson.isEmpty) {
          error('No News available');
          news.clear();
        } else {
          isError.value = false;
          news.value = newsJson.map((json) => News.fromJson(json)).toList();
        }
      } else {
        isError.value = true;
        error('Failed to fetch photos. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      error("An error occured, check your connection: $e");
      print("Error fetching photos: $e");
      isError.value = true;
    } finally {
      isError.value = true;
      isLoading(false);
    }
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
     // Link();
    } else {
      print('Could not launch $url');
    }
  }

  /*  void setSelectedPost(MarsPhoto selectedImage) {
    postModelObj.value = selectedImage;
  } */
}
