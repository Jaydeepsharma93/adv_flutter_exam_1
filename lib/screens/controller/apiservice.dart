import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService apiService = ApiService._singleton();

  ApiService._singleton();

  Future<String?> getData() async {
    String apiData = 'https://dummyjson.com/recipes';
    Uri uri = Uri.parse(apiData);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}


