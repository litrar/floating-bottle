import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeGender extends StatefulWidget {
  const ChangeGender({Key? key}) : super(key: key);

  @override
  State<ChangeGender> createState() => _ChangeGenderState();
}
class _ChangeGenderState extends State<ChangeGender> {
  bool wisChecked = false;
  bool misChecked = false;
  bool isChecked = false;
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
            Container(
              margin: EdgeInsets.only(left: 15.w,right: 20.w,top: 52.h),
              child: Row(
                children: [
                  IconButton(
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
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 110.h),
                  child: Text("   I'm a...",style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bellota-Regular',
                  ),),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Text("   Woman",style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        SizedBox(width: 220.w,),
                        Icon(
                          wisChecked ? Icons.check : null,
                          color: Colors.lightBlue,
                          size: 30.sp,
                        ),
                      ],
                    )
                  ),
                  onTap: (){
                    if(misChecked==false&&isChecked==false){
                      setState(() {
                        wisChecked = !wisChecked;
                      }
                      );
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Text("   Man",style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        SizedBox(width: 250.w,),
                        Icon(
                          misChecked ? Icons.check : null,
                          color: Colors.lightBlue,
                          size: 30.sp,
                        ),
                      ],
                    )
                  ),
                  onTap: (){
                    if(isChecked==false&&wisChecked==false){
                      setState(() {
                        misChecked = !misChecked;
                      }
                      );
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h),
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Text("   I don't want to reveal.",style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        SizedBox(width: 80.w,),
                        Icon(
                          isChecked ? Icons.check : null,
                          color: Colors.lightBlue,
                          size: 30.sp,
                        ),
                      ],
                    )
                  ),
                  onTap: (){
                    if(misChecked==false&&wisChecked==false){
                      setState(() {
                        isChecked = !isChecked;
                      }
                      );
                    }
                    }
                ),
              ],
            )
          ],
        )
    );
  }
}
