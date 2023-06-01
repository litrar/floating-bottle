import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevelopingPage extends StatelessWidget {
  const DevelopingPage(this.title,{super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assetsfolder/personal_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 15.w)),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 35.sp,
                    ),
                  ),
                  Text(' ${title}',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Abril Fatface',
                          fontSize: 25.sp))
                ],
              ),
              SizedBox(
                height: 200.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 60.w),
                alignment: Alignment.centerLeft,
                child: Text('Developing,',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Bellota-Regular',
                        fontSize: 40.sp)),
              ),
              Container(
                padding: EdgeInsets.only(left: 60.w),
                alignment: Alignment.centerLeft,
                child: Text('Coming Soon',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Bellota-Regular',
                        fontSize: 40.sp)),
              ),
            ]))
      ]),
    );
  }
}
