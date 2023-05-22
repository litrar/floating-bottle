import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'information.dart';
// import 'package:flutter_verification_box/verification_box.dart';

class Vertification extends StatefulWidget {
  const Vertification({Key? key}) : super(key: key);

  @override
  State<Vertification> createState() => _VertificationState();
}
class _VertificationState extends State<Vertification> {
  Widget build(BuildContext context) {
    return Scaffold(
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
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100.h, left: 20.w),
                    child:
                    Text("Almost there!", style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: Text(
                      "Plese enter the code that we have sent to your email for vertification.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.white,
                          height: 1.h
                      ),),
                  ),
                  _verifiField(),
                  _submitButton(),
                  _resendButton(),
                ],
              )
            ]
        )
    );
  }

  Widget _verifiField() {
    // return Container(
    //   height: 45,
    //   child: VerificationBox(
    //     count: 4,
    //   ),
    // );
    return Container(
      margin: EdgeInsets.only(left: 25.w,right: 25.w,top: 30.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 65.w,
                height: 70.h,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),

            SizedBox(
                width: 65.w,
                height: 70.h,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),

            SizedBox(
                width: 65.w,
                height: 70.h,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),

            SizedBox(
                width: 65.w,
                height: 70.h,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                  ),
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                )
            ),
          ]
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 25.h, bottom: 10.h),
      width: 350.w,
      height: 60.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(55))
            )
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Information();
              },
            ),
          );
        },
        child: Text("Submit", style: TextStyle(
            fontSize: 20.sp,color: Colors.white
        ),),
      ),
    );
  }

  Widget _resendButton() {
    return Container(
      width: 200.w,
      height: 60.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          },
              child: Text("Resend code", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  decoration: TextDecoration.underline
              ),))
        ],
      ),
    );
  }
}

