import 'package:floating_bottle/pages/personal_page/edit_interest_page.dart';
import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveInterest extends StatefulWidget {
  const SaveInterest({Key? key}) : super(key: key);

  @override
  State<SaveInterest> createState() => _SaveInterestState();
}
class _SaveInterestState extends State<SaveInterest> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            const  EditInterest(),
            Container(
              margin: const EdgeInsets.all(0),
              color: Colors.white60,
            ),
            Container(
                margin: EdgeInsets.only(top: 300.h,left: 70.w,right: 70.w,bottom: 290.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Are you sure to save it?",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            fontFamily: 'Bellota-Regular',
                          ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white,thickness: 1.5.h,),
                      Container(
                        margin: EdgeInsets.only(left: 11.w,top: 8.h),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90.w,
                              height: 40.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.red),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    )
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const Setting(email: "110306999@g.nccu.edu.tw",name:"");
                                      },
                                    ),
                                  );
                                },
                                child: Text("Yes", style: TextStyle(
                                    fontSize: 22.sp,color: Colors.white,fontFamily: 'Bellota-Regular'
                                ),),
                              ),
                            ),
                            VerticalDivider(color: Colors.white,width: 15.w,),
                            SizedBox(
                              width: 90.w,
                              height: 40.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    )
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No", style: TextStyle(
                                    fontSize: 22.sp,color: Colors.black,fontFamily: 'Bellota-Regular'
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}
