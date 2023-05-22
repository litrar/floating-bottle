import 'package:floating_bottle/pages/authentication/personality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gender.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);
  // final List<String> interests = ["Cooking","Photography","Art","Basketball","Dance"];
  @override
  State<Interest> createState() => _InterestState();
}
class _InterestState extends State<Interest> {
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
  bool cpressed = true;

  Widget build(BuildContext context){
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
                      TextButton(onPressed: (){
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
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 10.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          _cookingButton(),
                          _photoButton(),
                          _artButton(),
                          _basketballButton(),
                          _danceButton(),
                          _readingButton(),
                          _instrumentButton(),
                          _makeupButton(),
                          _cuisineButton(),
                          _codingButton()
                        ],
                      ),
                      Column(
                        children: [
                          _shoppingButton(),
                          _musicButton(),
                          _petButton(),
                          _tennisButton(),
                          _videoButton(),
                          _swimButton(),
                          _movieButton(),
                          _travelButton(),
                          _cartoonButton(),
                          _partyButton()
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.w,right: 30.w),
                  child: Row(
                    children: [
                      _continueButton()
                    ],
                  ),
                )
              ],
            )
          ]
      ),
    );
  }
  Widget _cookingButton(){
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
                children: [ pressed1
                    ?Icon(Icons.cookie_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.cookie_outlined,size: 25.sp,color: Colors.white,),
                  Text("Cooking",style: pressed1
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _photoButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed2 = !pressed2;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.h),
            height: 35.h,
            width: 151.w,
            decoration: pressed2
                ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35))
                : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ pressed2
                    ?Icon(Icons.camera_alt_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.camera_alt_outlined,size: 25.sp,color: Colors.white,),
                  Text("Photography",style: pressed2
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _artButton(){
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
              margin: EdgeInsets.only(right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ pressed3
                    ?Icon(Icons.color_lens_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.color_lens_outlined,size: 25.sp,color: Colors.white,),
                  Text("Art",style: pressed3
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _basketballButton(){
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
                children: [ pressed4
                    ?Icon(Icons.sports_basketball_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.sports_basketball_outlined,size: 25.sp,color: Colors.white,),
                  Text("Basketball",style: pressed4
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _danceButton(){
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
              margin: EdgeInsets.only(left: 5.w,right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ pressed5
                    ?Icon(Icons.accessibility_new_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.accessibility_new_outlined,size: 25.sp,color: Colors.white,),
                  Text("Dance",style: pressed5
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _readingButton(){
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
                children: [ pressed6
                    ?Icon(Icons.book_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.book_outlined,size: 25.sp,color: Colors.white,),
                  Text("Reading",style: pressed6
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _instrumentButton(){
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
                children: [ pressed7
                    ?Icon(Icons.piano,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.piano,size: 25.sp,color: Colors.white,),
                  Text("Instrument",style: pressed7
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _makeupButton(){
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
                children: [ pressed8
                    ?Icon(Icons.color_lens_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.color_lens_outlined,size: 25.sp,color: Colors.white,),
                  Text("Makeup",style: pressed8
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _cuisineButton(){
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
                children: [ pressed9
                    ?Icon(Icons.local_drink_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.local_drink_outlined,size: 25.sp,color: Colors.white,),
                  Text("Cuisine",style: pressed9
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _codingButton(){
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
                children: [ pressed10
                    ?Icon(Icons.computer,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.computer,size: 25.sp,color: Colors.white,),
                  Text("Coding",style: pressed10
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _shoppingButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            pressed11 = !pressed11;
          });
        },
        child: Container(
            margin: EdgeInsets.only(top: 2.h),
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
                children: [ pressed11
                    ?Icon(Icons.shopping_cart_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.shopping_cart_outlined,size: 25.sp,color: Colors.white,),
                  Text("Shopping",style: pressed11
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _musicButton(){
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
                children: [ pressed12
                    ?Icon(Icons.music_note_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.music_note_outlined,size: 25.sp,color: Colors.white,),
                  Text("Music",style: pressed12
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _petButton(){
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
              margin: EdgeInsets.only(left: 0.w,right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ pressed13
                    ?Icon(Icons.pets_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.pets_outlined,size: 25.sp,color: Colors.white,),
                  Text("Pet",style: pressed13
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _tennisButton(){
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
                children: [ pressed14
                    ?Icon(Icons.sports_tennis_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.sports_tennis_outlined,size: 25.sp,color: Colors.white,),
                  Text("Tennis",style: pressed14
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _videoButton(){
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
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ pressed15
                    ?Icon(Icons.videogame_asset_sharp,size: 22.sp,color: Colors.black,)
                    :Icon(Icons.videogame_asset_sharp,size: 22.sp,color: Colors.white,),
                  Text("Video Games",style: pressed15
                      ? TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _swimButton(){
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
                children: [ pressed16
                    ?Icon(Icons.water_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.water_outlined,size: 25.sp,color: Colors.white,),
                  Text("Swimming",style: pressed16
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _movieButton(){
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
                children: [ pressed17
                    ?Icon(Icons.movie_creation_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.movie_creation_outlined,size: 25.sp,color: Colors.white,),
                  Text("Movie",style: pressed17
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _travelButton(){
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
                children: [ pressed18
                    ?Icon(Icons.travel_explore_outlined,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.travel_explore_outlined,size: 25.sp,color: Colors.white,),
                  Text("Traveling",style: pressed18
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _cartoonButton(){
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
              margin: EdgeInsets.only(left: 5.w,right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ pressed19
                    ?Icon(Icons.tv,size: 25.sp,color: Colors.black,)
                    :Icon(Icons.tv,size: 25.sp,color: Colors.white,),
                  Text("Cartoon",style: pressed19
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _partyButton(){
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
                children: [ pressed20
                    ? Icon(Icons.celebration_outlined,size: 25.sp,color: Colors.black,)
                    : Icon(Icons.celebration_outlined,size: 25.sp,color: Colors.white,),
                  Text("Party",style: pressed20
                      ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            )
        )
    );
  }
  Widget _continueButton(){
    return TextButton(
        onPressed: (){
          if(pressed1 == false || pressed2 == false || pressed3 == false || pressed4 == false ||pressed5 == false || pressed6 == false || pressed7 == false || pressed8 == false || pressed9 == false || pressed10 == false
              || pressed11 == false || pressed12 == false || pressed13 == false || pressed14 == false ||pressed15 == false || pressed16 == false || pressed17 == false || pressed18 == false || pressed19 == false || pressed20 == false){
            setState(() {
              cpressed = !cpressed;
            });
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
          margin: EdgeInsets.only(top: 5.h),
          height: 55.h,
          width: 280.w,
          decoration: pressed1&&pressed2&&pressed3&&pressed4&&pressed5&&pressed6&&pressed7&&pressed8&&pressed9&&pressed10
              &&pressed11&&pressed12&&pressed13&&pressed14&&pressed15&&pressed16&&pressed17&&pressed18&&pressed19&&pressed20
              ? BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(55))
              : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(55)),
          alignment: Alignment.center,
          child: Text("Continue",style: pressed1&&pressed2&&pressed3&&pressed4&&pressed5&&pressed6&&pressed7&&pressed8&&pressed9&&pressed10
              &&pressed11&&pressed12&&pressed13&&pressed14&&pressed15&&pressed16&&pressed17&&pressed18&&pressed19&&pressed20
              ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
              : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
          ),
        )
    );
  }
}
