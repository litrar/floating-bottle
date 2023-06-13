import 'package:floating_bottle/api/match.dart';
import 'package:floating_bottle/pages/match_page/random_match_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/http_response.dart';
import '../../api/match/models/matched_user_info.dart';
import 'match_result.dart';

class SearchIDPage extends StatefulWidget {
  SearchIDPage({super.key, this.userId});
  int? userId;

  @override
  State<SearchIDPage> createState() => _SearchIDPageState();
}

class _SearchIDPageState extends State<SearchIDPage> {
  List<MatchedUserInfo> users = [
    MatchedUserInfo(
        avatar: 'assetsfolder/friend1.jpg',
        id: 67890,
        name: 'Ann',
        college: 'National Chengchi University',
        sex: 'Woman',
        city: 'Taipeisd',
        age: '20',
        personalities: ['Extroverted', 'Outgoing'],
        interests: ['Cooking', 'Movie', 'Pet'],
        isSelected: true),
  ];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // MatchApi matchApi = context.read();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assetsfolder/match_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 15.w)),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 35.sp,
                  ),
                ),
              ],
            ),
            _title(context),
            _searchBar(context)
          ],
        ))
      ],
    ));
  }

  Container _title(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 60.w),
      margin: EdgeInsets.only(top: 30.h),
      child: Text("I'm looking for Someone...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.sp,
            fontFamily: 'Abril Fatface',
          )),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(8.0),

      // Use a Material design search bar
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          iconColor: Colors.black,
          hintText: 'ID',
          // Add a clear button to the search bar
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () => _searchController.clear(),
          ),
          // Add a search icon or button to the search bar
          prefixIcon: IconButton(
            icon: const Icon(Icons.search, size: 30, color: Colors.black),
            onPressed: () async {
              // Perform the search here

              // if (int.parse(_searchController.text) == users[0].id) {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => const DMatchResultPage(),
              //     ),
              //   );
              // }
              MatchApi matchApi = context.read<MatchApi>();
              MatchedUserInfo? userInfo;
              List<MatchedUserInfo> userInfoList = [];
              int id = int.parse(_searchController.text);
              print(id);
              var res = await matchApi.getSearchIDMatch(id);
              if (res.isSuccess) {
                print('succeed');
                HttpRes<MatchedUserInfo> userRes =
                    await matchApi.showUserById(res.data!.id);
                userInfo = userRes.data;
                if (userInfo != null) {
                  userInfoList.add(userInfo);
                }

                Future.microtask(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MatchResultPage(matchedUsers: userInfoList);
                      },
                    ),
                  );
                });
              } else {
                Future.microtask(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DMatchResultPage(),
                    ),
                  );
                });
              }
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ),
    );
  }
}
