import 'package:dio/dio.dart';
import 'package:floating_bottle/controllers/registeration_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:floating_bottle/api/register_api.dart';
import 'information.dart';
import 'login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  RegisterationController registerationController = Get.put(RegisterationController());
  bool _passwordVisible = false;
  bool isChecked = false;
  // late final RegisterApi _registerApi;

  // void initState() {
  //   super.initState();
  //   _registerApi = RegisterApi(Dio());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assetsfolder/registration.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // IconButton(onPressed: onPressed, icon: icon),
        ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70.h, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an account!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.sp,
                        color: Colors.white),
                  ),
                  Text(
                    "Register to get started.",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                      height: 1.5.h,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            _nickNameField(),
            _emailField(),
            _passwordField(),
            _confirmPasswordField(),
            _agreeCheckbox(),
            _registerButton(),
            _loginTextButton(),
          ],
        )
      ]),
    );
  }

  Widget _nickNameField() {
    return Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Align(
            widthFactor: 2.3.w,
            child: Icon(
              Icons.person,
              size: 26.sp,
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " Nickname",
          hintStyle: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 20.h),
        ),
        style: TextStyle(
            fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3,
        controller: registerationController.nameController,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
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
          contentPadding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 20.h),
        ),
        style: TextStyle(
            fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3.w,
        controller: registerationController.emailController,
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
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
                  size: 25.sp,
                  color: Theme.of(context).primaryColorDark)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " Password",
          hintStyle: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 20.h),
        ),
        style: TextStyle(
            fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3.w,
        controller: registerationController.passwordController,
      ),
    );
  }

  Widget _confirmPasswordField() {
    return Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
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
                  size: 25.sp,
                  color: Theme.of(context).primaryColorDark)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " Confirm Password",
          hintStyle: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 20.h),
        ),
        style: TextStyle(
            fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3.w,
        controller: registerationController.confirmPasswordController,
      ),
    );
  }

  Widget _agreeCheckbox() {
    return Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
      child: CheckboxListTile(
        title: Text(
          "By registering, you are agreeing with our Terms of Use and Privacy Policy",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17.sp,
              color: Colors.white),
        ),
        side: const BorderSide(color: Colors.white),
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 15.h, bottom: 40.h),
      width: 350.w,
      height: 60.h,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55)))),
          onPressed: () async {
            registerationController.registerWithEmail();
            // _registerApi = new RegisterApi(new Dio());
            // var result =
            //     await _registerApi.register('a', 'b', 'c', 'c', 'd', 'e', 'f');
            if (isChecked == true) {
              // print(result);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Information();
                  },
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Registration();
                  },
                ),
              );
            }
          },
          child: Text(
            "Register",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          )),
    );
  }

  Widget _loginTextButton() {
    return Container(
      margin: EdgeInsets.only(left: 0.w, right: 0.w, top: 15.h, bottom: 0.h),
      color: const Color(0xFFB0C4DE),
      width: 200.w,
      height: 60.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "          Already have an account?",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Login();
                    },
                  ),
                );
              },
              child: Text(
                "Log in",
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
