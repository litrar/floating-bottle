import 'dart:convert';
import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';


class AccountDetailController extends GetxController{
  final Dio _dio = Dio();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  List<String> selectedInterests = <String>[].obs;
  List<String> selectedPersonality = <String>[].obs;
  List<String> selectedLanguage = <String>[].obs;
  String selectedSex = '';

  Future<void> accountDetailWithData() async{
    try{
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.accountDetail);
      Map<String, dynamic> body = {
        'Name': nameController.text,
        'Email': emailController.text,
        'Password': passwordController.text,
        'School': schoolController.text,
        'City': cityController.text,
        'BirthDate': birthDateController.text,
        'Sex': selectedSex,
        'Interest': selectedInterests,
        'Personality': selectedPersonality,
        'Language': selectedLanguage
      };
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        if(json['code'] == 0){
          var token = json['data']['token'];
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token',token);
          clearFormFields();
          Get.off(Login());
        }else{
          throw jsonDecode(response.body)["message"] ?? 'Unknown Error Occurred';
        }
      }else{
        throw jsonDecode(response.body)["Message"] ?? 'Unknown Error Occurred';
      }
    }catch (e){
      Get.back();
      Get.dialog(
        SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [
            Text(e.toString()),
          ],
        )
      );
    }
  }
  void toggleInterest(String interest){
    if(selectedInterests.contains(interest)){
      selectedInterests.remove(interest);
    }else{
      selectedInterests.add(interest);
    }
  }
  void togglePersonality(String personality) {
    if (selectedPersonality.contains(personality)) {
      selectedPersonality.remove(personality);
    } else {
      selectedPersonality.add(personality);
    }
  }
  void toggleLanguage(String language) {
    if (selectedLanguage.contains(language)) {
      selectedLanguage.remove(language);
    } else {
      selectedLanguage.add(language);
    }
  }
  void setSex(String sex) {
    selectedSex = sex;
  }
  void clearFormFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    schoolController.clear();
    cityController.clear();
    birthDateController.clear();
    selectedInterests.clear();
    selectedPersonality.clear();
    selectedLanguage.clear();
  }
}