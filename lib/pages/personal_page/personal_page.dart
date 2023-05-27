import 'package:floating_bottle/pages/personal_page/logout_page.dart';
import 'package:floating_bottle/pages/personal_page/setting_page.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../components/bottom_bar.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'change_name_page.dart';
import 'p_route.dart';

class PersonalSubPage implements SubPage {
  PersonalSubPage();
  @override
  Widget getIcon(bool active) {
    return active
        ? Image.asset("assetsfolder/account_black.png",
        cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetsfolder/account_white.png",
        cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GoRoute get route => p_route;
}

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ColorTheme>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: BottomBar(SubPage.PERSONAL),
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
            Column(
              children: [
                _avatar(context),
                _letterHistory(context),
                _messageBox(context),
                _settings(context),
                _contact(context),
                _logoutButton(context)
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _avatar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70.0),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 100.h,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipOval(
                child: Image.asset(
                  "assetsfolder/avatar.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: -1,
                bottom: -1,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const InkWell(
                    child: Icon(
                      Icons.add_a_photo,
                      size: 15.0,
                      color: Color(0xFF404040),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 21.h),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Remi Chuang ",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: 'Bellota-Regular',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChangeName(email: '', name: '',)),
                        );
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 20.h),
                child: Text(
                  " #ID: 12345",
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 97, 97),
                    fontSize: 14.sp,
                    fontFamily: 'Bellota-Regular',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _letterHistory(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 25.w)),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '8',
                    style: TextStyle(
                        fontSize: 36.sp,
                        fontFamily: 'Bellota-Regular',
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Letters Sent',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 99, 97, 97),
                      fontSize: 14.sp,
                      fontFamily: 'Bellota-Regular',
                    ),
                  ),
                ]),
            SizedBox(
              width: 60.w,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '32',
                style: TextStyle(
                    fontSize: 36.sp,
                    fontFamily: 'Bellota-Regular',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Letters Received',
                style: TextStyle(
                  color: const Color.fromARGB(255, 99, 97, 97),
                  fontSize: 14.sp,
                  fontFamily: 'Bellota-Regular',
                ),
              ),
            ]),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 25.sp,
              ),
            )
          ],
        ));
  }

  Widget _messageBox(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            border: Border.all(color: Colors.black)),
        child: InkWell(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20.w)),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.insert_comment_outlined,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                'Try Our Message Box',
                style: TextStyle(
                    fontSize: 21.sp,
                    fontFamily: 'Bellota-Regular',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Setting(email: "110306999@g.nccu.edu.tw",name:"");
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

          },
        )
    );
  }

  Widget _settings(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            border: Border.all(color: Colors.black)),
        child: InkWell(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20.w)),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Setting(email: "110306999@g.nccu.edu.tw",name:"");
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.settings_outlined, size: 40.0),
              ),
              SizedBox(
                width: 85.w,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    fontSize: 21.sp,
                    fontFamily: 'Bellota-Regular',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 82.w,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Setting(email: "110306999@g.nccu.edu.tw",name:"");
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
                  return const Setting(email: "110306999@g.nccu.edu.tw",name:"");
                },
              ),
            );
          },
        )
    );
  }

  Widget _contact(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            border: Border.all(color: Colors.black)),
        child: InkWell(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20.w)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.record_voice_over_outlined, size: 40.0),
              ),
              SizedBox(
                width: 70.w,
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: 21.sp,
                    fontFamily: 'Bellota-Regular',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 65.w,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Setting(email: "110306999@g.nccu.edu.tw",name:"");
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

          },
        )
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Logout();
                },
              ),
            );
          },
          child: Container(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 217, 201),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  'Log out',
                  style: TextStyle(
                      color: Color.fromARGB(255, 99, 97, 97),
                      fontSize: 21.sp,
                      fontFamily: 'Bellota-Regular',
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }
}