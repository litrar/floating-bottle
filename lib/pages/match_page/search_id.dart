import 'package:floating_bottle/pages/match_page/d_match_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mailbox_page/new_user.dart';

class SearchIDPage extends StatefulWidget {
  const SearchIDPage({super.key});

  @override
  State<SearchIDPage> createState() => _SearchIDPageState();
}

class _SearchIDPageState extends State<SearchIDPage> {
  List<NewUser> users = [
    NewUser(
        avatar: 'assetsfolder/friend1.jpg',
        id: 67890,
        name: 'Ann',
        school: 'National Chengchi University',
        gender: 'Woman',
        city: 'Taipeisd',
        age: '20',
        personalities: ['Extroverted', 'Outgoing'],
        interests: ['Cooking', 'Movie', 'Pet'],
        isSelected: true),
  ];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              // Perform the search here
              if (int.parse(_searchController.text) == users[0].id) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DMatchResultPage(),
                  ),
                );
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
