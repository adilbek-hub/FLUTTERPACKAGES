import 'package:dio/dio.dart';
import 'package:get_it_api_plaseholder/model.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<PlaceholderModel>?> fetchData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      final posts = data.map((e) => PlaceholderModel.fromJson(e)).toList();
      return posts;
    } else {
      return null;
    }
  }
}

final apiService = ApiService();
