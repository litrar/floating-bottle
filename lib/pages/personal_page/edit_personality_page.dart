import 'package:floating_bottle/pages/personal_page/save_personality_page.dart';
import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPersonality extends StatefulWidget {
  const EditPersonality({Key? key}) : super(key: key);

  @override
  State<EditPersonality> createState() => _EditPersonalityState();
}
class _EditPersonalityState extends State<EditPersonality> {
  bool pressed1 = true;
  bool pressed2 = true;
  bool pressed3 = true;
  bool pressed4 = true;
  bool pressed5 = true;
  bool pressed6 = true;
  bool pressed7 = true;
  bool pressed8 = true;
  bool pressed9 = true;
  bool pressed10 = true;
  bool pressed11 = true;
  bool pressed12 = true;
  bool pressed13 = true;
  bool pressed14 = true;
  bool pressed15 = true;
  bool pressed16 = true;
  bool pressed17 = true;
  bool pressed18 = true;
  bool pressed19 = true;
  bool pressed20 = true;
  Widget build(BuildContext context) {
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
                            return const Setting(email: "110306999@g.nccu.edu.tw",name:"");
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
                              return const SavePersonality();
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
              child: Row(
                children: [
                  Column(
                    children: [
                      _advenButton(),
                      _analyButton(),
                      _confidentButton(),
                      _creativeButton(),
                      _empatheticButton(),
                      _friendButton(),
                      _independentButton(),
                      _introButton(),
                      _optimisticButton(),
                      _orgaButton()
                    ],
                  ),
                  Column(
                    children: [
                      _reliaButton(),
                      _perfectButton(),
                      _meticuButton(),
                      _outgoingButton(),
                      _sponButton(),
                      _thoughButton(),
                      _trustButton(),
                      _visionButton(),
                      _warmButton(),
                      _wittyButton()
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
  Widget _advenButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed1 = !pressed1;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 2.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed1
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed1
                    ?Icon(Icons.compass_calibration_outlined,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.compass_calibration_outlined,size: 22.sp,color: Colors.white,),
                  Text("Adventurous",style: pressed1
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _analyButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed2 = !pressed2;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed2
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed2
                    ?Icon(Icons.analytics_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.analytics_outlined,size: 25.sp,color: Colors.white,),
                  Text("Analytical",style: pressed2
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _confidentButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed3 = !pressed3;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed3
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 0.w,right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed3
                    ?Icon(Icons.star,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.star,size: 25.sp,color: Colors.white,),
                  Text("Confident",style: pressed3
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _creativeButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed4 = !pressed4;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed4
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed4
                    ?Icon(Icons.create_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.create_outlined,size: 25.sp,color: Colors.white,),
                  Text("Creative",style: pressed4
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _empatheticButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed5 = !pressed5;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed5
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 10.w,right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed5
                    ?Icon(Icons.monitor_heart_outlined,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.monitor_heart_outlined,size: 22.sp,color: Colors.white,),
                  Text("Empathetic",style: pressed5
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _friendButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed6 = !pressed6;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed6
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed6
                    ?Icon(Icons.people_alt,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.people_alt,size: 25.sp,color: Colors.white,),
                  Text("Friendly",style: pressed6
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _independentButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed7 = !pressed7;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed7
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed7
                    ?Icon(Icons.person_rounded,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.person_rounded,size: 25.sp,color: Colors.white,),
                  Text("Indepedent",style: pressed7
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _introButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed8 = !pressed8;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed8
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed8
                    ?Icon(Icons.mood_bad_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.mood_bad_outlined,size: 25.sp,color: Colors.white,),
                  Text("Introverted",style: pressed8
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _optimisticButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed9 = !pressed9;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed9
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed9
                    ?Icon(Icons.tag_faces,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.tag_faces,size: 25.sp,color: Colors.white,),
                  Text("Optimistic",style: pressed9
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _orgaButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed10 = !pressed10;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed10
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed10
                    ?Icon(Icons.add_chart,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.add_chart,size: 25.sp,color: Colors.white,),
                  Text("Organized",style: pressed10
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _reliaButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed11 = !pressed11;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 5.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed11
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed11
                    ?Icon(Icons.people_alt_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.people_alt_outlined,size: 25.sp,color: Colors.white,),
                  Text("Reliable",style: pressed11
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _perfectButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed12 = !pressed12;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed12
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 0.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed12
                    ?Icon(Icons.thumb_up_alt_outlined,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.thumb_up_alt_outlined,size: 22.sp,color: Colors.white,),
                  Text("Perfectionist",style: pressed12
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _meticuButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed13 = !pressed13;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed13
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 0.w,right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed13
                    ?Icon(Icons.center_focus_strong_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.center_focus_strong_outlined,size: 25.sp,color: Colors.white,),
                  Text("Meticulous",style: pressed13
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _outgoingButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed14 = !pressed14;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed14
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed14
                    ?Icon(Icons.accessibility_new_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.accessibility_new_outlined,size: 25.sp,color: Colors.white,),
                  Text("Outgoing",style: pressed14
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _sponButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed15 = !pressed15;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed15
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 6.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed15
                    ?Icon(Icons.self_improvement_outlined,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.self_improvement_outlined,size: 22.sp,color: Colors.white,),
                  Text("Spontaneous",style: pressed15
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _thoughButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed16 = !pressed16;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed16
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed16
                    ?Icon(Icons.face,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.face,size: 25.sp,color: Colors.white,),
                  Text("Thoughtful",style: pressed16
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _trustButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed17 = !pressed17;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed17
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed17
                    ?Icon(Icons.badge_outlined,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.badge_outlined,size: 22.sp,color: Colors.white,),
                  Text("Trustworthy",style: pressed17
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _visionButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed18 = !pressed18;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed18
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed18
                    ?Icon(Icons.schedule,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.schedule,size: 25.sp,color: Colors.white,),
                  Text("Visionary",style: pressed18
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _warmButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed19 = !pressed19;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed19
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed19
                    ?Icon(Icons.heart_broken,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.heart_broken,size: 22.sp,color: Colors.white,),
                  Text("Warm-hearted",style: pressed19
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _wittyButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed20 = !pressed20;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 150.w,
            decoration: pressed20
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [pressed20
                    ?Icon(Icons.wb_incandescent_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.wb_incandescent_outlined,size: 25.sp,color: Colors.white,),
                  Text("Witty",style: pressed20
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
}