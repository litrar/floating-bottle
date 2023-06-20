import 'dart:convert';
import 'package:floating_bottle/controllers/registeration_controller.dart';
import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class AccountDetailController extends GetxController {
  RegisterationController registerationController = Get.put(RegisterationController());
  final _dio = dio.Dio()
  ..interceptors.add(dio.LogInterceptor(requestBody: true,responseBody: true));
  int accId = 6;
  TextEditingController schoolController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  List<String> selectedInterests = <String>[].obs;
  List<String> selectedPersonality = <String>[].obs;
  List<String> selectedLanguage = <String>[].obs;
  String selectedSex = '';
  String avatar = '';
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Map<String, dynamic> toJson() {
    return {
      'AccId': accId,
      'School': schoolController.text,
      'City': cityController.text,
      'BirthDate': birthDateController.text,
      'Sex': selectedSex.startsWith("W") ? "F" : "M",
      'Interest': selectedInterests,
      'Personality': selectedPersonality,
      'Language': selectedLanguage,
      'Avatar': dio.MultipartFile.fromString(avatar),
    };
  }
  
  Future<int> accountDetailWithData() async {
      var json = toJson();
      // await registerationController.registerWithEmail();
      // var accId = registerationController.accId;
      json["AccId"] = accId;
      // print(json);
      accId =6;
      var res = await _dio.post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.accountDetail,
        data: dio.FormData.fromMap(json),
        options: dio.Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      var responseData = res.data;
      // var token = json['data']['Token'];
      print(res.statusCode);
      // final SharedPreferences prefs = await _prefs;
      // await prefs.setInt("accId",  json["AccId"]);
      // await prefs.setString('token', token);
      // print(res.body);
      if (responseData != null && responseData["data"] != null) {
        // var accId = responseData["data"]["AccId"]; // Note the capital 'A' in 'AccId'
        return accId;
      } else {
        throw Exception("Error: Unable to retrieve accId from the response.");
      }
  }





  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
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
    schoolController.clear();
    cityController.clear();
    birthDateController.clear();
    selectedInterests.clear();
    selectedPersonality.clear();
    selectedLanguage.clear();
  }
}
