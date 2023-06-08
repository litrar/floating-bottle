import 'package:dio/dio.dart';
import 'package:floating_bottle/api/http_response.dart';

class RegisterApi {
  final Dio _dio;
  static const String nameSpace = "UserIdentity";

  RegisterApi(this._dio);

  Future<bool> register(String name, String password, String email,
      String school, String city, String birthday, String sex) async {
    
      final req = await _dio.post(
        "https://9edb-140-119-120-6.ngrok-free.app/api/userIdentity/register",
        data: {
          'Name': name,
          'Password': password,
          'Email': email,
          'School': school,
          'City': city,
          'Birthdate': birthday,
          'Sex': sex,
        },
      );
      return req.statusCode == 200;
    
  }
}
