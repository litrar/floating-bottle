import 'package:floating_bottle/controllers/registeration_controller.dart';
import 'package:floating_bottle/pages/authentication/personality.dart';
import 'package:floating_bottle/pages/authentication/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/account_detail_controller.dart';
import 'login.dart';

class LanguageLevelResult extends StatefulWidget {
  const LanguageLevelResult({Key? key, required this.item,this.accId})
      : super(key: key);
  final String item;
  final int? accId;
  @override
  State<LanguageLevelResult> createState() => _LanguageLevelResultState();
}

class _LanguageLevelResultState extends State<LanguageLevelResult> {
  RegisterationController registerationController = Get.put(RegisterationController());
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  @override
  Widget build(BuildContext context) {
    widget.item;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assetsfolder/information_background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Personality();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 36.sp,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LanguageLevelResult(item: widget.item);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.w, top: 30.h),
              child: Text(
                "I can speak ...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30.w, left: 30.w, top: 30.h),
              height: 50.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(55),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(55),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30.sp,
                        )),
                    Text(
                      "Enter the language",
                      style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                    )
                  ],
                ),
                onTap: () {
                  //跳轉頁面
                  showSearch(context: context, delegate: SearchBarDelegate(widget.accId));
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 50.w, left: 50.w, top: 20.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70,
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.item,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            _continueButton(),
          ],
        )
      ]),
    );
  }

  Widget _continueButton() {
    return Container(
      margin:
          EdgeInsets.only(left: 35.w, right: 35.w, top: 320.h, bottom: 20.h),
      width: 350.w,
      height: 60.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55)))),
        // onPressed: () async {
        //   await accountDetailController.accountDetailWithData();
        //   // registerationController.registerWithEmail();
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) {
        //         return Login(accId: widget.accId,);
        //       },
        //     ),
        //   );
        // },
        onPressed: () async {
          try {
            await accountDetailController.accountDetailWithData();
            // registerationController.registerWithEmail();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Login(accId: widget.accId);
                },
              ),
            );
          } catch (e) {
            // Handle the exception here
            print('Error during accountDetailWithData: $e');
            // Show an error message or perform any other necessary actions
          }
        },

        child: Text(
          "Start",
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ),
    );
  }
}
