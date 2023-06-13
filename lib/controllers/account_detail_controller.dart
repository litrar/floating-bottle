import 'dart:convert';
import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class AccountDetailController extends GetxController {
  final _dio = dio.Dio()
  ..interceptors.add(dio.LogInterceptor(requestBody: true,responseBody: true));
  int accId = 0;
  TextEditingController schoolController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  List<String> selectedInterests = <String>[].obs;
  List<String> selectedPersonality = <String>[].obs;
  List<String> selectedLanguage = <String>[].obs;
  String selectedSex = '';
  String avatar = '';

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
    json["AccId"] = 21;
    print(json);
    var res = await _dio.post(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.accountDetail,
        data: dio.FormData.fromMap(json),
        options: dio.Options(headers: {'Content-Type': 'multipart/form-data'}));
    return res.data["data"]["accId"];
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
