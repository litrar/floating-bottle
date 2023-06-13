import 'dart:convert';
import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class AccountDetailController extends GetxController {
  final Dio _dio = Dio();
  int accId = 0;
  TextEditingController schoolController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  List<String> selectedInterests = <String>[].obs;
  List<String> selectedPersonality = <String>[].obs;
  List<String> selectedLanguage = <String>[].obs;
  String selectedSex = '';

  Map<String, dynamic> toJson() {
    return {
      'AccId': accId,
      'School': schoolController.text,
      'City': cityController.text,
      'BirthDate': birthDateController.text,
      'Sex': selectedSex,
      'Interest': selectedInterests,
      'Personality': selectedPersonality,
      'Language': selectedLanguage,
    };
  }


  Future<void> accountDetailWithData() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.accountDetail);
      var body = toJson();

      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['token'];
          var accIdValue;
          try {
            accIdValue = int.parse(json['data']['accId'].toString());
          } catch (e) {
            accIdValue = 0; // 设置默认值
          }
          accId = accIdValue;
          print(accId);
          // print('account id: $accId');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          await prefs?.setInt('accId', accId!);
          clearFormFields();
          Get.off(Login());
        } else {
          throw jsonDecode(response.body)["message"] ?? 'Unknown Error Occurred';
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? 'Unknown Error Occurred';
      }
    } catch (e) {
      Get.back();
      Get.dialog(
        AlertDialog(
          title: Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
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
