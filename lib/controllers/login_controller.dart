import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:floating_bottle/pages/contact_page/contact.dart';
import 'package:floating_bottle/pages/personal_page/personal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/components/bottom_bar.dart';
import '../utils/api_endpoints.dart';
import 'account_detail_controller.dart';

class LoginController extends GetxController {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  Dio dio = Dio()..interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<int> loginWithEmail() async {
    // var headers = {'ngrok-skip-browser-warning': 'true'};
    var data = {
      'nccuEmail': emailController.text.trim(),
      'Password': passwordController.text
    };
    print(data);
    var res = await dio.post(ApiEndPoints.baseUrl+ApiEndPoints.authEndpoints.loginEmail,
    data: data,
    options: Options(
      headers: {'Content-Type': 'application/json'},
    ));
    emailController.clear();
    passwordController.clear();
    accountDetailController.accId = res.data["data"]["accId"];

    //Get.off(ContactPage(),arguments: accountDetailController.accId);
    BottomBar.userId = accountDetailController.accId;
    return accountDetailController.accId;
  }
}