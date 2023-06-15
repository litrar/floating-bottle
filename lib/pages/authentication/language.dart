import 'package:floating_bottle/pages/authentication/personality.dart';
import 'package:floating_bottle/pages/authentication/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);


  @override
  State<Language> createState() => _LanguageState();
}
class _LanguageState extends State<Language> {
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
                                return const Personality();
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
                              return const Language();
                            },
                          ),
                        );
                      },
                        child: Text("Skip",style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.w,top: 30.h),
                  child: Text("I can speak ...",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.sp,
                      color: Colors.white
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.w,left: 30.w,top: 40.h),
                  height: 50.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(55),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10.w,right: 10.w),
                            child: Icon(Icons.search,color: Colors.black,size: 30.sp,)),
                        Text("Enter the language",style: TextStyle(color: Colors.grey,fontSize: 18.sp),)
                      ],
                    ),
                    onTap: (){
                      //跳轉頁面
                      showSearch(context: context,delegate: SearchBarDelegate());
                    },
                  ),
                ),
                _continueButton(),
              ],
            )
          ]
      ),
    );
  }
  Widget _continueButton() {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 450.h, bottom: 20.h),
      width: 350.w,
      height: 70.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
            )
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Language();
              },
            ),
          );
        },
        child: Text("Continue", style: TextStyle(
            fontSize: 20.sp,color: Colors.white
        ),),
      ),
    );
  }
}

