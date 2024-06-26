import 'package:floating_bottle/controllers/login_controller.dart';
import 'package:floating_bottle/pages/authentication/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/account_detail_controller.dart';
import '../subpage.dart';

class Login extends StatefulWidget {
  const Login({Key? key,this.accId}) : super(key: key);
  final int? accId;

  @override
  State<Login> createState() => _LoginPageState();
  static final GetPage route = GetPage(
    name: "/logIn",
    page: () => const Login(),
  );
}

class _LoginPageState extends State<Login> {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  LoginController loginController = Get.put(LoginController());
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assetsfolder/registration.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 120.h),
                child: Column(
                  children: [
                    Text(
                      "Hi there!",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp,
                          color: Colors.white),
                    ),
                    Text(
                      "Let's Get Penpals",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33.sp,
                        height: 1.h,
                        color: Colors.white,
                      ),
                    ),
                    _emailField(),
                    _passwordField(),
                    _loginButton(),
                    Text(
                      "or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    _createAccountButton(),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 40.h),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Align(
            widthFactor: 2.3.w,
            child: Icon(
              Icons.email_outlined,
              size: 26.sp,
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " Email Address",
          hintStyle: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding:
             EdgeInsets.symmetric(horizontal: 1.w, vertical: 20.h),
        ),
        style: TextStyle(
            fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3.w,
        controller: loginController.emailController,
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 20.h),
      child: TextField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Align(
            widthFactor: 2.3.w,
            child: Icon(
              Icons.lock,
              size: 26.sp,
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 23.sp,
                  color: Theme.of(context).primaryColorDark)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 1.w, vertical: 20.h),
        ),
        style: TextStyle(
            fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3.w,
        controller: loginController.passwordController,
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 20.h, bottom: 25.h),
      width: 300.w,
      height: 60.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55)))),
        onPressed: () async {
          var id =await loginController.loginWithEmail();
          // context.go(SubPage.PERSONAL.route.path);
          Get.toNamed(SubPage.MATCH.route.name, arguments: id);
        },
        child: Text(
          "Log in",
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ),
    );
  }

  Widget _createAccountButton() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 25.h, bottom: 40.h),
      width: 300.w,
      height: 60.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55)))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Registration();
              },
            ),
          );
        },
        child: Text(
          "Create an account",
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ),
    );
  }
}
