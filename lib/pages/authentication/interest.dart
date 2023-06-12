import 'package:floating_bottle/pages/authentication/personality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/account_detail_controller.dart';
import 'button1.dart';
import 'gender.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);
  @override
  State<Interest> createState() => _InterestState();
}
class _InterestState extends State<Interest> {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  bool cpressed = false;
  bool p1 = true;

  Widget build(BuildContext context){
    final List<MyButton1> buttons = [
      MyButton1((isSelected) => setState(() {}), bName: 'Cooking', icon: const Icon(Icons.cookie_outlined)),
      MyButton1((isSelected) => setState(() {}), bName: 'Photography', icon: const Icon(Icons.camera_alt_outlined),),
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
                                return const Gender();
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
                              return const Personality();
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
                  child: Text("My Interests",style: TextStyle(
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
  Widget _continueButton(BuildContext context, List<MyButton1> buttons) {
    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].getBool() == true) {
        accountDetailController.selectedInterests.add(buttons[i].bName);
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
             if(accountDetailController.selectedInterests.isNotEmpty){
               accountDetailController.accountDetailWithData();
               print(accountDetailController.selectedInterests);
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) {
                     return const Personality();
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