import 'package:floating_bottle/pages/mailbox_page/other_reasons_report.dart';
import 'package:floating_bottle/pages/mailbox_page/send_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}
class _ReportState extends State<Report> {
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
            margin: EdgeInsets.only(left: 15.w,right: 20.w,top: 60.h),
            child: Row(
              children: [
                IconButton(
                  onPressed:(){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded,size: 35.sp,color: Colors.blueGrey,),),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70.h,left: 120.w),
                child: Text("Reasons for reporting？",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Bellota-Regular',
                ),),
              ),
              Divider(thickness: 2.h,color: Colors.black,),
              Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        child: Text("I don't like the content of this letter.",style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SendReport();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.5.h,color: Colors.black,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        child: Text("Slander, discriminate, provoke or abuse others.",style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SendReport();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.5.h,color: Colors.black,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        child: Text("Contains offensive content such as pornography, sexual harassment, or gore.",style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SendReport();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.5.h,color: Colors.black,),
                    InkWell(
                      child: Text("Violence, harm to people or animals.",style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Bellota-Regular',
                      ),),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SendReport();
                            },
                          ),
                        );
                      },
                    ),
                    Divider(thickness: 1.5.h,color: Colors.black,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        child: Text("Content that contains advertisements and commercial promotions.",style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SendReport();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.5.h,color: Colors.black,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        child: Text("Other reasons.",style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bellota-Regular',
                        ),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const OtherReasonsReport();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.5.h,color: Colors.black,),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}