import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/account_detail_controller.dart';
import 'information.dart';
import 'interest.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key,this.accId}) : super(key: key);
  final int? accId;

  @override
  State<Gender> createState() => _GenderState();
}
class _GenderState extends State<Gender> {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  bool wpressed = true;
  bool mpressed = true;
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
                                  return const Information();
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
                                return Interest(accId: widget.accId,);
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
                    margin: EdgeInsets.only(left: 40.w,top: 70.h),
                    child: Text("I'm a...",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Colors.white
                    ),),
                  ),
                  _womanButton(),
                  _manButton(),
                  _continueButton(),
                ],
              )
            ]
        )
    );
  }
  Widget _womanButton(){
    return TextButton(
        onPressed: (){
          if(mpressed == true){
            setState(() {
              wpressed = !wpressed;
              if(wpressed==false){
                accountDetailController.selectedSex = 'Woman';
              }else{
                accountDetailController.selectedSex = '';
              }
            });
          }else{
            setState(() {
              wpressed == wpressed;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30.h),
          height: 60.h,
          width: 300.w,
          decoration: wpressed
              ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(55))
              : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(55)),
          alignment: Alignment.center,
          child: Text("Woman",style: wpressed
              ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
              : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
          ),
        )
    );
  }
  Widget _manButton(){
    return TextButton(
        onPressed: (){
          if(wpressed == true){
            setState(() {
              mpressed = !mpressed;
              if(mpressed==false){
                accountDetailController.selectedSex = 'Man';
              }else{
                accountDetailController.selectedSex = '';
              }
            });
          }else{
            setState(() {
              mpressed == mpressed;
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 60.h,
          width: 300.w,
          decoration: mpressed
              ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(55))
              : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(55)),
          alignment: Alignment.center,
          child: Text("Man",style: mpressed
              ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
              : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
          ),
        )
    );
  }
  Widget _continueButton(){
    return TextButton(
        onPressed: ()async{
          if(wpressed == false || mpressed == false){
            setState(() {
              cpressed = !cpressed;
            });
            if(accountDetailController.selectedSex.isNotEmpty){
              // int accId = 11;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Interest(accId: widget.accId,);
                  },
                ),
              );
              await accountDetailController.accountDetailWithData();
              print(accountDetailController.selectedSex);
              // accountDetailController.accountDetailWithData();
            }else {
              print("請選擇性別");
            }
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 200.h),
          height: 60.h,
          width: 300.w,
          decoration: wpressed&&mpressed
              ? BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(55))
              : BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(55)),
          alignment: Alignment.center,
          child: Text("Continue",style: wpressed&&mpressed
              ? TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)
              : TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold)
          ),
        )
    );
  }
}