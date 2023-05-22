import 'package:floating_bottle/pages/personal_page/delete_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}
class _SettingState extends State<Setting> {
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MailBoxPage();
                    //     },
                    //   ),
                    // );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded,size: 35.sp,color: Colors.blueGrey,),),
                Text("  Settings",style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bellota-Regular',
                ),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 110.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("        Account",style: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: 'Bellota-Regular',
                ),),
                _account(context),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  child: Text("        Personal",style: TextStyle(
                    color: Colors.grey.shade900,
                    fontFamily: 'Bellota-Regular',
                  ),),
                ),
                _name(context),
                _gender(context),
                _interest(context),
                _personality(context),
                _city(context),
                _language(context),
                Container(
                  margin: EdgeInsets.only(top: 50.h,left: 83.w),
                  child: SizedBox(
                    width: 200.w,
                    height: 45.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                          )
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const DeleteAccount();
                            },
                          ),
                        );
                      },
                      child: Text("Delete Account", style: TextStyle(
                          fontSize: 22.sp,color: Colors.white,fontFamily: 'Bellota-Regular'
                      ),),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
Widget _account(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.email_outlined, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Email',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold),
                  ),
                  Text("110306999@g.nccu.edu.tw")
                ],
              ),
            ),
            SizedBox(
              width: 90.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}
Widget _name(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.person_rounded, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Change Name',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Bellota-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 120.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}
Widget _gender(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.male, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Change Gender',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Bellota-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 110.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}
Widget _interest(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.interests, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Edit Interests',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Bellota-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 130.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}Widget _personality(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.monitor_heart, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Edit Personality',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Bellota-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 107.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}
Widget _city(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.location_city, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Edit City',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Bellota-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 162.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}
Widget _language(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20.w)),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.language, size: 40.0),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Edit Language',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Bellota-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 116.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
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
                return const Setting();
              },
            ),
          );
        },
      )
  );
}
