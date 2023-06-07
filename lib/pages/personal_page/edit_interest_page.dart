import 'package:floating_bottle/pages/personal_page/save_interest_page.dart';
import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../authentication/button1.dart';

class EditInterest extends StatefulWidget {
  const EditInterest({Key? key}) : super(key: key);

  @override
  State<EditInterest> createState() => _EditInterestState();
}
class _EditInterestState extends State<EditInterest> {
  Widget build(BuildContext context) {
    final List<MyButton1> buttons = [
      MyButton1((isSelected) => setState(() {}), bName: 'Cooking', icon: const Icon(Icons.cookie_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Photography', icon: const Icon(Icons.camera_alt_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Art', icon: const Icon(Icons.color_lens_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Basketball', icon: const Icon(Icons.sports_basketball_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Dance', icon: const Icon(Icons.accessibility_new_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Reading', icon: const Icon(Icons.book_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Instrument', icon: const Icon(Icons.piano)),
      MyButton1((isSelected) => setState(() {}), bName: 'Makeup', icon: const Icon(Icons.color_lens_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Cuisine', icon: const Icon(Icons.local_drink_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Coding', icon: const Icon(Icons.computer)),
      MyButton1((isSelected) => setState(() {}), bName: 'Shopping', icon: const Icon(Icons.shopping_cart_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Music', icon: const Icon(Icons.music_note_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Pet', icon: const Icon(Icons.pets_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Tennis', icon: const Icon(Icons.sports_tennis_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Video Games', icon: const Icon(Icons.videogame_asset_sharp)),
      MyButton1((isSelected) => setState(() {}), bName: 'Swimming', icon: const Icon(Icons.water_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Movie', icon: const Icon(Icons.movie_creation_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Traveling', icon: const Icon(Icons.travel_explore_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Cartoon', icon: const Icon(Icons.tv)),
      MyButton1((isSelected) => setState(() {}), bName: 'Party', icon: const Icon(Icons.celebration_outlined)),
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
                              return const SaveInterest();
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
              child: button(context, buttons),
            ),
          ],
        )
    );
  }
  Widget button(BuildContext context,List<MyButton1> buttons){
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