import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:floating_bottle/utils/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class RegisterationController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Dio dio = Dio();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try{
      // var headers = {'ngrok-skip-browser-warning': 'true'};
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'Name' : nameController.text,
        'Email' : emailController.text,
        'Password' : passwordController.text,
        'ConfirmPassword' : confirmPasswordController.text,
      };

      http.Response response = await http.post(
          url,
          body: jsonEncode(body),
          headers: headers);

      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        if(json['code'] == 0){
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          // Get.off(Information());
        }else{
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      }else{
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    }catch(e){
        Get.back();
        showDialog(
            context: Get.context!,
            builder: (context){
              return SimpleDialog(
                title: Text('Error'),
                contentPadding: EdgeInsets.all(20),
                children: [
                  Text(e.toString())
                ],
              );
            });
    }
  }
}