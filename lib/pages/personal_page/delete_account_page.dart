import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/user/profile.dart';
import '../authentication/login.dart';

class DeleteAccount extends StatefulWidget {
  DeleteAccount({Key? key, required this.profile}) : super(key: key);
  final Profile profile;
  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Setting(
              profile: widget.profile,
              email: "110306999@g.nccu.edu.tw",
              name: ""),
          Container(
            margin: const EdgeInsets.all(0),
            color: Colors.white60,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 300.h, left: 70.w, right: 70.w, bottom: 270.h),
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
                        Text(
                          "Are you sure to\ndelete this Account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            fontFamily: 'Bellota-Regular',
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 11.w, top: 8.h),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 95.w,
                            height: 40.h,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Login();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.white,
                                    fontFamily: 'Bellota-Regular'),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            width: 7.w,
                          ),
                          SizedBox(
                            width: 95.w,
                            height: 40.h,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.black,
                                    fontFamily: 'Bellota-Regular'),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
