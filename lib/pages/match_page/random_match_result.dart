import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../contact_page/contact_detail.dart';
import '../../api/match/models/matched_user_info.dart';
import '../write_letter.dart';

class DMatchResultPage extends StatefulWidget {
  const DMatchResultPage({super.key});

  @override
  State<DMatchResultPage> createState() => _DMatchResultPageState();
}

class _DMatchResultPageState extends State<DMatchResultPage> {
  List<MatchedUserInfo> users = [
    MatchedUserInfo(
        avatar: 'assetsfolder/friend1.jpg',
        id: 67890,
        name: 'Ann',
        college: 'National Chengchi University',
        sex: 'Woman',
        city: 'Taipeisd',
        age: 20,
        personalities: ['Extroverted', 'Outgoing'],
        interests: ['Cooking', 'Movie', 'Pet'],
        isSelected: true),
  ];
  bool cbutton = true;

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
            _matchedUser(context, users[0]),
            _continueButton(context,users[0]),
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
      child: Text("I find...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.sp,
            fontFamily: 'Abril Fatface',
          )),
    );
  }

  Widget _matchedUser(BuildContext context, MatchedUserInfo user) {
    return Container(
      margin: users.length == 1
          ? EdgeInsets.only(top: 120.h)
          : EdgeInsets.only(top: 20.h),
      height: 60.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: user.isSelected!
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              border: Border.all(color: Colors.black))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color.fromARGB(255, 86, 140, 167),
              border: Border.all(color: Colors.black)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            setState(() {
              user.isSelected = !user.isSelected!;
            });
            if (user.isSelected == false) {
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
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Colors.white,
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

  Widget _continueButton(BuildContext context,MatchedUserInfo user) {
    List<bool> check = users.map((e) => e.isSelected!).toList();

    return InkWell(
        onTap: () {
          if (check.contains(false)) {
            setState(() {
              cbutton = !cbutton;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WriteLetter(matcherId: 1,matchedAccountId: user.id,time: DateTime.now(),name: user.name,replyToPending: false,);
                  },
                ),
              );
            });
          }
        },
        child: Container(
          
          margin: users.length == 1
              ? EdgeInsets.only(top: 210.h)
              : users.length == 2
                  ? EdgeInsets.only(top: 150.h)
                  : EdgeInsets.only(top: 90.h),
          height: 55.h,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: !check.contains(false)
              ? BoxDecoration(
                  color: Color.fromARGB(255, 152, 169, 189),
                  borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: const Color.fromARGB(255, 86, 140, 167),
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: const Text("Send a letter",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
