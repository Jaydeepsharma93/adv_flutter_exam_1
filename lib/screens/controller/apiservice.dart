import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class ApiService{

  void getData(){
    String apiData = 'https://dummyjson.com/recipes';
    Uri uri = Uri.parse(apiData);
    http.Response response  = http.get(uri);
  }
}
