import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../pages/subpage.dart';


class BottomBar extends StatelessWidget {

  SubPage currentPage;
  BottomBar(this.currentPage,{Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: SubPage.PAGES.indexOf(currentPage),
      selectedItemColor: Colors.black,

      selectedLabelStyle: TextStyle(color: Colors.black,fontSize: 10.sp),
      unselectedLabelStyle: TextStyle(color: Colors.black,fontSize: 10.sp),
      unselectedFontSize: 14.sp,
      selectedFontSize: 14.sp,
      type: BottomNavigationBarType.fixed,
      onTap: (page) {
        context.go(SubPage.PAGES[page].route.path);
      },
      items: [
        for (var page in SubPage.PAGES)
          BottomNavigationBarItem(
              icon: Container(
                  width: 43.w,
                  height: 30.h,
                  margin: EdgeInsets.only(top: 10.h,bottom: 7.h),
                  child: page.getIcon(false)
              ),
              activeIcon: Container(
                width: 43.w,
                height: 30.h,
                margin: EdgeInsets.only(top: 10.h,bottom: 7.h),
                child: page.getIcon(true),
              ),
              label: page.label
          )
      ],
    );
  }
}
