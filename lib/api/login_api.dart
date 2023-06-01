import 'package:dio/dio.dart';
import 'package:floating_bottle/api/http_response.dart';

class LoginApi {
  static final Dio _httpClient = new Dio();
  static const String nameSpace = "UserIdentity";
  Future<bool> register(String name, String password, String email,
      String school, String city, String birthday, String sex) async {
    
    final req = await _httpClient.post(
      "http://140.119.19.77/api/$nameSpace/signin",
      data: {
      'Name': name,
      'Password': password,
      'Email': email,
      'School': school,
      'City': city
    },
    );
    return req.statusCode == 200;
  }
}
