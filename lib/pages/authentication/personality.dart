import 'package:floating_bottle/pages/authentication/button2.dart';
import 'package:floating_bottle/pages/authentication/interest.dart';
import 'package:floating_bottle/pages/authentication/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/account_detail_controller.dart';


class Personality extends StatefulWidget {
  const Personality({Key? key}) : super(key: key);
  @override
  State<Personality> createState() => _PersonalityState();
}
class _PersonalityState extends State<Personality> {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  bool cpressed = false;
  bool p1 = true;

  Widget build(BuildContext context){
    final List<MyButton2> buttons = [
      MyButton2((isSelected) => setState(() {}), bName: 'Adventurous', icon: const Icon(Icons.compass_calibration_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Analytical', icon: const Icon(Icons.analytics_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Confident', icon: const Icon(Icons.star)),
      MyButton2((isSelected) => setState(() {}), bName: 'Creative', icon: const Icon(Icons.create_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Empathetic', icon: const Icon(Icons.monitor_heart_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Friendly', icon: const Icon(Icons.people_alt)),
      MyButton2((isSelected) => setState(() {}), bName: 'Independent', icon: const Icon(Icons.person_rounded)),
      MyButton2((isSelected) => setState(() {}), bName: 'Introverted', icon: const Icon(Icons.mood_bad_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Optimistic', icon: const Icon(Icons.tag_faces)),
      MyButton2((isSelected) => setState(() {}), bName: 'Organized', icon: const Icon(Icons.add_chart)),
      MyButton2((isSelected) => setState(() {}), bName: 'Reliable', icon: const Icon(Icons.people_alt_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Perfectionist', icon: const Icon(Icons.thumb_up_alt_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Meticulous', icon: const Icon(Icons.center_focus_strong_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Outgoing', icon: const Icon(Icons.accessibility_new_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Spontaneous', icon: const Icon(Icons.self_improvement_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Thoughtful', icon: const Icon(Icons.face)),
      MyButton2((isSelected) => setState(() {}), bName: 'Trustworthy', icon: const Icon(Icons.badge_outlined)),
      MyButton2((isSelected) => setState(() {}), bName: 'Visionary', icon: const Icon(Icons.schedule)),
      MyButton2((isSelected) => setState(() {}), bName: 'Warm-hearted', icon: const Icon(Icons.heart_broken)),
      MyButton2((isSelected) => setState(() {}), bName: 'Witty', icon: const Icon(Icons.wb_incandescent_outlined)),
    ];


    return Scaffold(
      body: Stack(
          children: <Widget>[
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
                  margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Interest();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded,size: 36.sp,color: Colors.white,),),
                      TextButton(onPressed: ()async{
                        accountDetailController.accountDetailWithData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Language();
                            },
                          ),
                        );
                      },
                        child: Text("Skip",style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.w,top: 5.h),
                  child: Text("My Personalities",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: Colors.white
                  ),),
                ),
                button(context, buttons),
                _continueButton(context,buttons)
              ],
            )
          ]
      ),
    );
  }
  Widget button(BuildContext context,List<MyButton2> buttons){
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
  Widget _continueButton(BuildContext context, List<MyButton2> buttons) {
    for (int i = 0; i < 19; i++) {
      if (buttons[i].getBool() == true) {
        accountDetailController.selectedPersonality.add(buttons[i].bName);
        p1 = !p1;
        break;
      }
    }
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 40.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: p1
          ? BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(35))
          : BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(35)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
            onTap: () {
              if(accountDetailController.selectedPersonality.isNotEmpty){
                accountDetailController.accountDetailWithData();
                print(accountDetailController.selectedPersonality);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Language();
                    },
                  ),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text("Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )
        ),
      ),
    );
  }
}