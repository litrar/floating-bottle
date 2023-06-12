import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton3 extends StatefulWidget {
  const MyButton3(this.setStatePage, {super.key, required this.icon, required this.bName});
  final Icon icon;
  final String bName;
  final void Function(bool isSelected) setStatePage;




  bool getBool() {
    return _MyButton3State().isSelected;
  }

  @override
  State<MyButton3> createState() => _MyButton3State();
}

class _MyButton3State extends State<MyButton3> {
  bool isSelected = false;
  late Icon icons;
  String name = "";

  @override
  void initState() {
    icons = widget.icon;
    name = widget.bName;
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
            widget.setStatePage(isSelected);
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
