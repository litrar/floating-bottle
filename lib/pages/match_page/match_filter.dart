import 'package:floating_bottle/api/match.dart';
import 'package:floating_bottle/api/match/models/filter_fillout_data.dart';
import 'package:floating_bottle/pages/components/button.dart';
import 'package:floating_bottle/pages/match_page/match.dart';
import 'package:floating_bottle/pages/match_page/match_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

import '../../api/http_response.dart';
import '../../api/match/models/match_result.dart';
import '../../api/match/models/matched_user_info.dart';

class MatchFilterPage extends StatefulWidget {
  MatchFilterPage({Key? key, this.userId}) : super(key: key);
  int? userId;

  @override
  State<MatchFilterPage> createState() => _MatchFilterPageState();
}

class _MatchFilterPageState extends State<MatchFilterPage> {
  bool isSelected = false;
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  bool p4 = false;
  String searchValue = "";
  final List<String> suggestions_c = [
    'Taipei City',
    'New Taipei City',
    'Kaohsiung City'
  ];
  final List<String> suggestions_l = ['Mandarin', 'English', 'Spanish'];

  @override
  Widget build(BuildContext context) {
    // MatchApi matchApi = context.read();

    final List<MyButton> buttons = [
      MyButton(
        () => setState(() {}),
        bName: 'Same School',
        f: context.read<FilterFillOutData>(),
        category: 'college',
      ),
      MyButton(() => setState(() {}),
          bName: 'Same Major',
          f: context.read<FilterFillOutData>(),
          category: 'department'),
      MyButton(() => setState(() {}),
          bName: 'Different School',
          f: context.read<FilterFillOutData>(),
          category: 'college'),
      MyButton(() => setState(() {}),
          bName: 'Different Major',
          f: context.read<FilterFillOutData>(),
          category: 'department'),
      MyButton(() => setState(() {}),
          bName: 'Female',
          f: context.read<FilterFillOutData>(),
          category: 'sex'),
      MyButton(() => setState(() {}),
          bName: 'Male', f: context.read<FilterFillOutData>(), category: 'sex'),
      MyButton(() => setState(() {}),
          bName: 'Adventurous',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Reliable',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Analytical',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Perfectionist',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Confident',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Meticulous',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Creative',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Outgoing',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Empathetic',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Spontaneous',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Friendly',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Thoughtful',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Independent',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Trustworthy',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Introverted',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Extroverted',
          f: context.read<FilterFillOutData>(),
          category: 'personalities'),
      MyButton(() => setState(() {}),
          bName: 'Cooking',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Photography',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Music',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Art',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Pet',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Sports',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Dancing',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Games',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Reading',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Traveling',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Coding',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Cuisine',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Makeup',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
      MyButton(() => setState(() {}),
          bName: 'Movie',
          f: context.read<FilterFillOutData>(),
          category: 'interests'),
    ];
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
                _school(context, buttons),
                _sexual(context, buttons),
                _city(context, context.read<FilterFillOutData>()),
                _language(context, context.read<FilterFillOutData>()),
                _personality(context, buttons),
                _interest(context, buttons),
                _continueButton(context, buttons)
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
            context.read<FilterFillOutData>().clear();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MatchPage();
                },
              ),
            );
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

  Widget _school(BuildContext context, List<MyButton> buttons) {
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

  Widget _sexual(BuildContext context, List<MyButton> buttons) {
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

  Widget _city(BuildContext context, FilterFillOutData f) {
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
                      onSuggestionTap: (SearchFieldListItem<String> x) {
                        f.city =
                            x.searchKey.substring(0, x.searchKey.length - 5);
                        print(f.all());
                      },
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

  Widget _language(BuildContext context, FilterFillOutData f) {
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
                      onSuggestionTap: (SearchFieldListItem<String> x) {
                        f.languages.add("'${x.searchKey}'");
                        print(f.all());
                      },
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

  Widget _personality(BuildContext context, List<MyButton> buttons) {
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

  Widget _interest(BuildContext context, List<MyButton> buttons) {
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

  Widget _continueButton(BuildContext context, List<MyButton> buttons) {
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
            onTap: () async {
              print('${widget.userId} at match_filter.dart');
              List<MatchedUserInfo> userInfoList = [];
              MatchedUserInfo? userInfo;
              MatchApi matchApi = context.read<MatchApi>();

              var res = await matchApi
                  .getFilterMatch(context.read<FilterFillOutData>());
              if (res.isSuccess) {
                print('succeed at match_filter.dart _continueButton');
                for (MatchResult m in res.data!) {
                  HttpRes<MatchedUserInfo> userRes =
                      await matchApi.showUserById(m.id);
                  userInfo = userRes.data;
                  if (userInfo != null) {
                    userInfoList.add(userInfo);
                  }
                }
                Future.microtask(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MatchResultPage(matchedUsers: userInfoList, userId: widget.userId,);
                      },
                    ),
                  );
                });
              } else {
                print('fail at match_filter.dart _continueButton');
                Future.microtask(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MatchResultPage();
                      },
                    ),
                  );
                });
              }
            },

            // onTap: () async {
            //   // for (int i = 0; i < 4; i++) {
            //   //   if (buttons[i].getBool() == true) {
            //   //     p1 = !p1;
            //   //     break;
            //   //   }
            //   // }
            //   // for (int i = 4; i < 6; i++) {
            //   //   if (buttons[i].getBool() == true) {
            //   //     p2 = !p2;
            //   //     break;
            //   //   }
            //   // }
            //   // for (int i = 6; i < 22; i++) {
            //   //   if (buttons[i].getBool() == true) {
            //   //     p3 = !p3;
            //   //     break;
            //   //   }
            //   // }
            //   // for (int i = 22; i < 36; i++) {
            //   //   if (buttons[i].getBool() == true) {
            //   //     p4 = !p4;
            //   //     break;
            //   //   }
            //   // }
            //   print('$p1$p2$p3$p4');
            //   List<MatchedUserInfo> userInfoList = [];
            //   MatchedUserInfo userInfo;
            //   MatchApi matchApi = context.read();
            //   var res = await matchApi
            //       .getFilterMatch(context.read<FilterFillOutData>());

            //   if (res.isSuccess) {
            //     for (MatchResult m in res.data!) {
            //       userInfo = (await matchApi.showUserById(m.id)) as MatchedUserInfo;
            //       userInfoList.add(userInfo);
            //     }
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return MatchResultPage(matchResult: userInfoList);
            //         },
            //       ),
            //     );
            //   }
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) {
            //         return MatchResultPage();
            //       },
            //     ),
            //   );
            // },
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
