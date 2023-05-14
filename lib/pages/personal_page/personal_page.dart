import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../components/bottom_bar.dart';
import '../theme/color_theme.dart';
import '../theme/theme_bloc.dart';
import 'edit_name.dart';
import 'p_route.dart';
import 'package:image_picker/image_picker.dart';

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
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _avatar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      height: 92.h,
      child: Row(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 18.w, right: 5.w),
              width: 90.w,
              height: 65.h,
              child: InkWell(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image == null) return;
                  // var res =
                  // await buildContext.read<UserApi>().editAvatar(image.path);
                  // if (res.isSuccess) {
                  //   await DialogService.show(CustomDialog(title: "更換頭貼成功"));
                  // } else
                  //   await DialogService.show(
                  //       CustomDialog(title: "更換頭貼失敗", content: res.message));
                  //rebuild
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Stack(
                      children: [
                        Image.asset("assetsfolder/avatar.jpg"),
                        // userInfo.avatar == null
                        //     ? Image.asset("assetfolder/Gray.jpg")
                        //     : Image(
                        //     image: CachedNetworkImageProvider(
                        //         userInfo.avatar!)),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 15.h,
                            width: double.maxFinite,
                            color: Colors.black,
                            child: Icon(Icons.photo_camera_outlined,
                                size: 13.sp, color: Colors.blue),
                          ),
                        )
                      ],
                    )),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 21.h),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Remi Chuang",
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditNamePage()),
                        );
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        size: 24.sp,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // padding: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.fromLTRB(10, 0, 0, 20.h),
                child: Text(
                  "haha",
                  style: TextStyle(fontSize: 12.sp),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
