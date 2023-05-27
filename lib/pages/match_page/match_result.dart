import 'package:floating_bottle/pages/contact_page/contact_detail.dart';
import 'package:floating_bottle/pages/mailbox_page/new_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../write_letter.dart';

class MatchResultPage extends StatefulWidget {
  MatchResultPage({super.key, this.id});
  int? id;
  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  List<NewUser> users = [
    NewUser(
        avatar: 'assetsfolder/friend1.jpg',
        name: 'Ann',
        school: 'National Chengchi University',
        gender: 'Woman',
        city: 'Taipeisd',
        age: '20',
        personalities: ['Extroverted', 'Outgoing'],
        interests: ['Cooking', 'Movie', 'Pet'],
        isSelected: true),
    NewUser(
        avatar: 'assetsfolder/friend3.jpg',
        name: 'Hanns',
        school: 'National Chengchi University',
        gender: 'Man',
        city: 'Taipei',
        age: '19',
        personalities: ['Extroverted', 'Trustworthy'],
        interests: ['Cooking', 'Reading'],
        isSelected: true),
    NewUser(
        avatar: 'assetsfolder/friend2.jpg',
        name: 'Stella',
        school: 'National Chengchi University',
        gender: 'Woman',
        city: 'Taipei',
        age: '20',
        personalities: ['Outgoing', 'Reliable'],
        interests: ['Movie', 'Pet'],
        isSelected: true),
  ];
  bool cbutton = true;

  @override
  Widget build(BuildContext context) {
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
            _matchedUser(context, users[0]),
            _matchedUser(context, users[1]),
            _matchedUser(context, users[2]),
            _continueButton(context),
          ],
        ))
      ]),
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

  Widget _matchedUser(BuildContext context, NewUser user) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
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

  Widget _continueButton(BuildContext context) {
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
                    return WriteLetter();
                  },
                ),
              );
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 90.h,
          ),
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