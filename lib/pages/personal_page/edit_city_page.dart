import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

import '../../api/user/profile.dart';

class EditCity extends StatefulWidget {
  EditCity({Key? key, required this.profile}) : super(key: key);
  Profile profile;

  @override
  State<EditCity> createState() => _EditCityState();
}
class _EditCityState extends State<EditCity> {
  final List<String> suggestions_c = [
    'Taipei City',
    'New Taipei City',
    'Kaohsiung City'
  ];
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
                            return Setting(profile: widget.profile);
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded,size: 35.sp,color: Colors.blueGrey,),),
                  Container(
                    margin: EdgeInsets.only(top: 10.h,left: 210.w),
                    child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Setting(profile: widget.profile);
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
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 120.h,left: 30.w,bottom: 10.h),
                  child:
                  Row(
                    children: [
                      Text("I live in...",style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Bellota-Regular',
                      ),),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80.h,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(color: Colors.black)),
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: _city(context),
                ),
              ],
            )
          ],
        )
    );
  }
  Widget _city(BuildContext context) {
    return Container(
        height: 70.h,
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.w),
                child: Text('City',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Abril Fatface',
                    ))),
            Container(
              height: 30.h,
              padding: EdgeInsets.only(left: 8.w),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(
                      suggestions: suggestions_c
                          .map((e) => SearchFieldListItem<String>(e,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 4.h),
                            child: Text(e,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontFamily: 'Abril Fatface')),
                          )))
                          .toList(),
                      marginColor: Colors.white,
                      searchStyle: TextStyle(
                          fontSize: 16.sp, fontFamily: 'Abril Fatface'),
                      searchInputDecoration:
                      const InputDecoration(border: InputBorder.none),
                      suggestionItemDecoration: BoxDecoration(
                          color: Colors.black
                              .withOpacity(0.9)),
                      key: const Key('searchfield'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ));
  }
}