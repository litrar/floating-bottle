import 'package:floating_bottle/pages/personal_page/personal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../authentication/login.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}
class _LogoutState extends State<Logout> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            PersonalPage(),
            Container(
              margin: const EdgeInsets.all(0),
              color: Colors.white60,
            ),
            Container(
                margin: EdgeInsets.only(top: 300.h,left: 70.w,right: 70.w,bottom: 290.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Are you sure to log out?",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            fontFamily: 'Bellota-Regular',
                          ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white,thickness: 1.5.h,),
                      Container(
                        margin: EdgeInsets.only(left: 11.w,top: 8.h),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90.w,
                              height: 40.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.red),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    )
                                ),
                                onPressed: () {
                                  Get.to(Login.route);
                                  // context.go(
                                  //   Login.route.,
                                  // );
                                },
                                child: Text("Yes", style: TextStyle(
                                    fontSize: 22.sp,color: Colors.white,fontFamily: 'Bellota-Regular'
                                ),),
                              ),
                            ),
                            VerticalDivider(color: Colors.white,width: 15.w,),
                            SizedBox(
                              width: 90.w,
                              height: 40.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    )
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No", style: TextStyle(
                                    fontSize: 22.sp,color: Colors.black,fontFamily: 'Bellota-Regular'
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}