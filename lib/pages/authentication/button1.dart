import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/account_detail_controller.dart';

class MyButton1 extends StatefulWidget {
  const MyButton1(this.setStatePage, {super.key, required this.icon, required this.bName});
  final Icon icon;
  final String bName;
  final void Function(bool isSelected) setStatePage;



  bool getBool() {
    return _MyButton1State().isSelected;
  }

  @override
  State<MyButton1> createState() => _MyButton1State();
}

class _MyButton1State extends State<MyButton1> {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  bool isSelected = false;
  late Icon icons;
  String name = "";

  @override
  void initState() {
    icons = widget.icon;
    name = widget.bName;
    isSelected = accountDetailController.selectedInterests.contains(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: isSelected
          ? BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(35))
          : BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.white)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
            accountDetailController.toggleInterest(name);
          },
          child: Container(
            padding: EdgeInsets.only(left: 13.w),
              alignment: Alignment.center,
              child: Row(
                children: [ isSelected
                    ?Icon(icons.icon,color: Colors.white, size: 20.sp)
                    :Icon(icons.icon,color: Colors.black, size: 20.sp),
                SizedBox(width: 8.w,),
                Text(name,
                      style: isSelected
                          ? TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold)
                          : TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold))
                ],
              )
          ),
        ),
      ),
    );
  }
}
