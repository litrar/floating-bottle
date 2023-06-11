import 'package:floating_bottle/pages/contact_page/contact_detail.dart';
import 'package:floating_bottle/api/user/user_info.dart';
import 'package:floating_bottle/pages/match_page/bloc/selected_people_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../write_letter.dart';

class MatchResultPage extends StatefulWidget {
  MatchResultPage({super.key, this.id});
  List<int>? id;
  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  List<UserInfo> users = [
    UserInfo(
        id: 1,
        avatar: 'assetsfolder/friend1.jpg',
        name: 'Ann',
        college: 'National Chengchi University',
        sex: 'Woman',
        city: 'Taipeisd',
        age: '20',
        personalities: ['Extroverted', 'Outgoing'],
        interests: ['Cooking', 'Movie', 'Pet'],
        isSelected: false),
    UserInfo(
        id: 2,
        avatar: 'assetsfolder/friend3.jpg',
        name: 'Hanns',
        college: 'National Chengchi University',
        sex: 'Man',
        city: 'Taipei',
        age: '19',
        personalities: ['Extroverted', 'Trustworthy'],
        interests: ['Cooking', 'Reading'],
        isSelected: false),
    UserInfo(
        id: 3,
        avatar: 'assetsfolder/friend2.jpg',
        name: 'Stella',
        college: 'National Chengchi University',
        sex: 'Woman',
        city: 'Taipei',
        age: '20',
        personalities: ['Outgoing', 'Reliable'],
        interests: ['Movie', 'Pet'],
        isSelected: false),
  ];
  bool cbutton = true;

  @override
  Widget build(BuildContext _context) {
    return BlocProvider(
      lazy: true,
      create: (_) => SelectedUsersCubit(users),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Stack(children: [
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
                SizedBox(
                  height: 30.h,
                ),
                BlocBuilder<SelectedUsersCubit, List<UserInfo>>(
                    builder: (context, state) {
                  return Column(children: [
                    for (var user in users)
                      _matchedUser(context.read(), context, user)
                  ]);
                }),
                _continueButton(context),
              ],
            ))
          ]),
        );
      }),
    );
  }

  Container _title(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 60.w),
      margin: EdgeInsets.only(top: 30.h),
      child: Text("I find...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.sp,
            fontFamily: 'Abril Fatface',
          )),
    );
  }

  Widget _matchedUser(
      SelectedUsersCubit cubit, BuildContext context, UserInfo user) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 60.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: user.isSelected!
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color.fromARGB(255, 86, 140, 167),
              border: Border.all(color: Colors.black))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              border: Border.all(color: Colors.black)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            cubit.set_selected(user.id!, !user.isSelected);
            if (user.isSelected == true) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactDetailPage(user: user),
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(children: [
              ClipOval(
                child: Image.asset(
                  user.avatar!,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                user.name,
                style: user.isSelected!
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    // List<bool> check = users.map((e) => e.isSelected!).toList();

    return BlocBuilder<SelectedUsersCubit, List<UserInfo>>(
        builder: (context, state) {
      SelectedUsersCubit cubit = context.read();
      UserInfo? selected = cubit.getSelect();

      return InkWell(
          onTap: () {
            if (selected != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WriteLetter();
                  },
                ),
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 90.h,
            ),
            height: 55.h,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: !(selected == null)
            // selected?.isSelected ?? false
                ? BoxDecoration(
                    color: const Color.fromARGB(255, 86, 140, 167),
                    borderRadius: BorderRadius.circular(35))
                : BoxDecoration(
                    color: const Color.fromARGB(255, 152, 169, 189),
                    borderRadius: BorderRadius.circular(35)),
            alignment: Alignment.center,
            child: const Text("Send a letter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ));
    });
  }
}
