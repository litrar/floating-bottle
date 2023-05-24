import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:floating_bottle/pages/components/button.dart';
import 'package:floating_bottle/pages/match_page/match_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class MatchFilterPage extends StatefulWidget {
  const MatchFilterPage({Key? key}) : super(key: key);
  @override
  State<MatchFilterPage> createState() => _MatchFilterPageState();
}

class _MatchFilterPageState extends State<MatchFilterPage> {
  bool isSelected = false;
  String searchValue = "";
  final List<MyButton> buttons = [
    const MyButton(bName: 'Same School'),
    const MyButton(bName: 'Same Major'),
    const MyButton(bName: 'Different School'),
    const MyButton(bName: 'Different Major'),
    const MyButton(bName: 'Female'),
    const MyButton(bName: 'Male'),
    const MyButton(bName: 'Adventurous'),
    const MyButton(bName: 'Reliable'),
    const MyButton(bName: 'Analytical'),
    const MyButton(bName: 'Perfectionist'),
    const MyButton(bName: 'Confident'),
    const MyButton(bName: 'Meticulous'),
    const MyButton(bName: 'Creative'),
    const MyButton(bName: 'Outgoing'),
    const MyButton(bName: 'Empathetic'),
    const MyButton(bName: 'Spontaneous'),
    const MyButton(bName: 'Friendly'),
    const MyButton(bName: 'Thoughtful'),
    const MyButton(bName: 'Independent'),
    const MyButton(bName: 'Trustworthy'),
    const MyButton(bName: 'Introverted'),
    const MyButton(bName: 'Extroverted'),
    const MyButton(bName: 'Cooking'),
    const MyButton(bName: 'Photography'),
    const MyButton(bName: 'Music'),
    const MyButton(bName: 'Art'),
    const MyButton(bName: 'Pet'),
    const MyButton(bName: 'Sports'),
    const MyButton(bName: 'Dancing'),
    const MyButton(bName: 'Games'),
    const MyButton(bName: 'Reading'),
    const MyButton(bName: 'Traveling'),
    const MyButton(bName: 'Coding'),
    const MyButton(bName: 'Cuisine'),
    const MyButton(bName: 'Makeup'),
    const MyButton(bName: 'Movie'),
  ];
  final List<String> suggestions_c = [
    'Taipei City',
    'New Taipei City',
    'Kaohsiung City'
  ];

  final List<String> suggestions_l = ['Chinese', 'English', 'Spanish'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assetsfolder/personal_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: SafeArea(
            child: Column(
              children: [
                _arrowBack(context),
                _title(context),
                _school(context),
                _sexual(context),
                _city(context),
                _language(context),
                _personality(context),
                _interest(context),
                _continueButton(context)
              ],
            ),
          ))
        ],
      ),
    );
  }

  Row _arrowBack(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 15.w)),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: const Color.fromARGB(255, 59, 138, 178),
            size: 35.sp,
          ),
        ),
      ],
    );
  }

  Container _title(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Text("I'm looking for Someone...",
          style: TextStyle(
            color: const Color.fromARGB(255, 59, 138, 178),
            fontSize: 25.sp,
            fontFamily: 'Abril Fatface',
          )),
    );
  }

  Widget _school(BuildContext context) {
    return Container(
        height: 110.h,
        margin: EdgeInsets.only(top: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.w),
                child: Text('School',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 59, 138, 178),
                      fontSize: 20.sp,
                      fontFamily: 'Abril Fatface',
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[0],
              SizedBox(
                width: 10.w,
              ),
              buttons[1],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[2],
              SizedBox(
                width: 10.w,
              ),
              buttons[3],
            ])
          ],
        ));
  }

  Widget _sexual(BuildContext context) {
    return Container(
        height: 75.h,
        margin: EdgeInsets.only(top: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.w),
                child: Text('Sexual',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 59, 138, 178),
                      fontSize: 20.sp,
                      fontFamily: 'Abril Fatface',
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[4],
              SizedBox(
                width: 10.w,
              ),
              buttons[5],
            ]),
          ],
        ));
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
                      color: const Color.fromARGB(255, 230, 228, 228),
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
                          color: const Color.fromARGB(255, 55, 55, 55)
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

  Widget _language(BuildContext context) {
    return Container(
        height: 70.h,
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.w),
                child: Text('Language',
                    style: TextStyle(
                      color: Colors.white,
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
                      suggestions: suggestions_l
                          .map((e) => SearchFieldListItem<String>(e,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 4.h),
                                child: Text(e,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color.fromARGB(
                                            255, 230, 228, 228),
                                        fontFamily: 'Abril Fatface')),
                              )))
                          .toList(),
                      marginColor: Colors.white,
                      searchStyle: TextStyle(
                          fontSize: 16.sp, fontFamily: 'Abril Fatface'),
                      searchInputDecoration:
                          const InputDecoration(border: InputBorder.none),
                      suggestionItemDecoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.9)),
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

  Widget _personality(BuildContext context) {
    return Container(
        height: 345.h,
        margin: EdgeInsets.only(top: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.w),
                child: Text('Personality',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Abril Fatface',
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[6],
              SizedBox(
                width: 10.w,
              ),
              buttons[7],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[8],
              SizedBox(
                width: 10.w,
              ),
              buttons[9],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[10],
              SizedBox(
                width: 10.w,
              ),
              buttons[11],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[12],
              SizedBox(
                width: 10.w,
              ),
              buttons[13],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[14],
              SizedBox(
                width: 10.w,
              ),
              buttons[15],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[16],
              SizedBox(
                width: 10.w,
              ),
              buttons[17],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[18],
              SizedBox(
                width: 10.w,
              ),
              buttons[19],
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              buttons[20],
              SizedBox(
                width: 10.w,
              ),
              buttons[21],
            ]),
          ],
        ));
  }

  Widget _interest(BuildContext context) {
    return Container(
      height: 300.h,
      margin: EdgeInsets.only(top: 10.h),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30.w),
            child: Text('Interests',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: 'Abril Fatface',
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttons[22],
            SizedBox(
              width: 10.w,
            ),
            buttons[23],
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[24],
          SizedBox(
            width: 10.w,
          ),
          buttons[25],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[26],
          SizedBox(
            width: 10.w,
          ),
          buttons[27],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[28],
          SizedBox(
            width: 10.w,
          ),
          buttons[29],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[30],
          SizedBox(
            width: 10.w,
          ),
          buttons[31],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[32],
          SizedBox(
            width: 10.w,
          ),
          buttons[33],
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttons[34],
          SizedBox(
            width: 10.w,
          ),
          buttons[35],
        ]),
      ]),
    );
  }

  Widget _continueButton(BuildContext context) {
    bool p1 = true;
    bool p2 = true;
    bool p3 = true;
    bool p4 = true;

    for (int i = 0; i < 4; i++) {
      if (buttons[i].getBool() == true) {
        p1 = !p1;
        break;
      }
    }
    for (int i = 4; i < 6; i++) {
      if (buttons[i].getBool() == true) {
        p2 = !p2;
        break;
      }
    }
    for (int i = 6; i < 22; i++) {
      if (buttons[i].getBool() == true) {
        p3 = !p3;
        break;
      }
    }
    for (int i = 22; i < 36; i++) {
      if (buttons[i].getBool() == true) {
        p4 = !p4;
        break;
      }
    }
    bool cbutton = true;
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 40.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: p1 && p2 && p3 && p4
          ? BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(35))
          : BoxDecoration(
              color: const Color.fromARGB(255, 86, 140, 167),
              borderRadius: BorderRadius.circular(35)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
            onTap: () {
              // if (p1 == false || p2 == false || p3 == false || p4 == false) {
              //   setState(() {
              //     cbutton = !cbutton;
              //     print('d');
              //   });
              // } else
              //   print('no');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MatchResultPage();
                  },
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text("Find Someone",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )),
      ),
    );
  }
}
