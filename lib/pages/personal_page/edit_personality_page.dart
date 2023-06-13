import 'package:floating_bottle/pages/authentication/button3.dart';
import 'package:floating_bottle/pages/personal_page/save_personality_page.dart';
import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/user/profile.dart';


class EditPersonality extends StatefulWidget {
  const EditPersonality({Key? key, required this.profile}) : super(key: key);
final Profile profile;
  @override
  State<EditPersonality> createState() => _EditPersonalityState();
}
class _EditPersonalityState extends State<EditPersonality> {
  Widget build(BuildContext context) {
    final List<MyButton3> buttons = [
      MyButton3((isSelected) => setState(() {}), bName: 'Adventurous', icon: const Icon(Icons.compass_calibration_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Analytical', icon: const Icon(Icons.analytics_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Confident', icon: const Icon(Icons.star)),
      MyButton3((isSelected) => setState(() {}), bName: 'Creative', icon: const Icon(Icons.create_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Empathetic', icon: const Icon(Icons.monitor_heart_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Friendly', icon: const Icon(Icons.people_alt)),
      MyButton3((isSelected) => setState(() {}), bName: 'Independent', icon: const Icon(Icons.person_rounded)),
      MyButton3((isSelected) => setState(() {}), bName: 'Introverted', icon: const Icon(Icons.mood_bad_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Optimistic', icon: const Icon(Icons.tag_faces)),
      MyButton3((isSelected) => setState(() {}), bName: 'Organized', icon: const Icon(Icons.add_chart)),
      MyButton3((isSelected) => setState(() {}), bName: 'Reliable', icon: const Icon(Icons.people_alt_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Perfectionist', icon: const Icon(Icons.thumb_up_alt_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Meticulous', icon: const Icon(Icons.center_focus_strong_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Outgoing', icon: const Icon(Icons.accessibility_new_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Spontaneous', icon: const Icon(Icons.self_improvement_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Thoughtful', icon: const Icon(Icons.face)),
      MyButton3((isSelected) => setState(() {}), bName: 'Trustworthy', icon: const Icon(Icons.badge_outlined)),
      MyButton3((isSelected) => setState(() {}), bName: 'Visionary', icon: const Icon(Icons.schedule)),
      MyButton3((isSelected) => setState(() {}), bName: 'Warm-hearted', icon: const Icon(Icons.heart_broken)),
      MyButton3((isSelected) => setState(() {}), bName: 'Witty', icon: const Icon(Icons.wb_incandescent_outlined)),
    ];
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assetsfolder/personal_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 20.w,top: 52.h),
                  child: IconButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Setting(profile: widget.profile,email: "110306999@g.nccu.edu.tw",name:"");
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded,size: 35.sp,color: Colors.blueGrey,),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 55.h,left: 200.w),
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SavePersonality(profile: widget.profile,);
                            },
                          ),
                        );
                      },
                      child: Text("Save",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                          fontFamily: 'Bellota-Regular',
                          color: Colors.blueGrey
                      ),)),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w,right: 10.w,top: 120.h),
              child:  button(context, buttons),
            ),
          ],
        )
    );
  }
  Widget button(BuildContext context,List<MyButton3> buttons){
    return Container(
      height: 500.h,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // padding: EdgeInsets.only(left: 30.w),
              child: buttons[0],
            ),
            SizedBox(
              width: 10.w,
            ),
            buttons[10],
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[1],
          SizedBox(
            width: 10.w,
          ),
          buttons[11],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[2],
          SizedBox(
            width: 10.w,
          ),
          buttons[12],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[3],
          SizedBox(
            width: 10.w,
          ),
          buttons[13],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[4],
          SizedBox(
            width: 10.w,
          ),
          buttons[14],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[5],
          SizedBox(
            width: 10.w,
          ),
          buttons[15],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[6],
          SizedBox(
            width: 10.w,
          ),
          buttons[16],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[7],
          SizedBox(
            width: 10.w,
          ),
          buttons[17],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[8],
          SizedBox(
            width: 10.w,
          ),
          buttons[18],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[9],
          SizedBox(
            width: 10.w,
          ),
          buttons[19],
        ]),
      ]),
    );
  }
}