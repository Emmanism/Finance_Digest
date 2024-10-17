import 'package:get/get.dart';

class ApiClient extends GetConnect {
  final String _token = 'crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg';


  Future<Response> fetchNews(int limit, int page) async {
    final String url =
            'https://finnhub.io/api/v1/news?category=general&token=$_token&limit=$limit&page=$page';

    try {
      final response = await get(url);

      if (response.isOk) {
        return response;
      } else {
        print('Error: ${response.statusText}');
        throw Exception('Failed to load News');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Error fetching News');
    }
  }
}