import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_email_page.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key,required this.email}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
  final String email;
}
class _ChangeEmailState extends State<ChangeEmail> {
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
                            return Setting(email: "${widget.email}",name:"");
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded,size: 35.sp,color: Colors.blueGrey,),),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 120.h,left: 30.w,bottom: 5.h),
                  child:
                      Row(
                        children: [
                          Text("Change E-mail",style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Bellota-Regular',
                          ),)
                        ],
                      ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 65.h,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.black)),
                    child: InkWell(
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 10.w)),
                          Container(
                              child:
                              Text("${widget.email}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.black,
                                fontFamily: 'Bellota-Regular',
                              ),)
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const EditEmail();
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 25.sp,
                            ),
                          )
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const EditEmail();
                            },
                          ),
                        );
                      },
                    ),
                ),
              ],
            )
          ],
        )
    );
  }
}