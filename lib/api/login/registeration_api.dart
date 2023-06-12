// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import '../../utils/api_endpoints.dart';
//
// class RegisterApi {
//   final Dio dio;
//
//   RegisterApi(this.dio);
//
//   Future<void> registerUser(String name, String email, String password, String confirmPassword) async {
//     try {
//       var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
//       var headers = {'Content-Type': 'application/json'};
//       var body = {
//         'name': name,
//         'email': email,
//         'password': password,
//         'confirmPassword': confirmPassword,
//       };
//
//       var response = await dio.post("https://ecc3-111-241-177-116.ngrok-free.app/api/Register",
//           data:  await http.Response.data.toData(),
//           options: Options(headers: headers));
//
//       if (response.statusCode == 200) {
//         var json = jsonDecode(response.body);
//         if (json['code'] == 0) {
//           // Registration successful
//           // Handle success logic or navigate to the next screen
//         } else {
//           // Registration failed
//           var errorMessage = json['message'] ?? 'Unknown Error Occurred';
//           // Handle error logic or display an error message
//         }
//       } else {
//         // HTTP request failed
//         var errorMessage = jsonDecode(response.body)['Message'] ?? 'Unknown Error Occurred';
//         // Handle error logic or display an error message
//       }
//     } catch (e) {
//       // Exception occurred
//       var errorMessage = 'An error occurred: $e';
//       // Handle exception or display an error message
//       print(errorMessage);
//     }
//   }
// }
