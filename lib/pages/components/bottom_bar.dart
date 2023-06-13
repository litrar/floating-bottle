import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../subpage.dart';

class BottomBar extends StatelessWidget {
  SubPage currentPage;
  int? userId;
  BottomBar(this.currentPage, {Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 189, 205, 214),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: SubPage.PAGES.indexOf(currentPage),
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 10.sp),
      unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 10.sp),
      unselectedFontSize: 14.sp,
      selectedFontSize: 14.sp,
      type: BottomNavigationBarType.fixed,
      onTap: (page) {
        // context.go(SubPage.PAGES[page].route.path);
        Get.to(SubPage.PAGES[page].route.page, arguments: userId);
      },
      items: [
        for (var page in SubPage.PAGES)
          BottomNavigationBarItem(
              icon: Container(
                  width: 43.w,
                  height: 30.h,
                  margin: EdgeInsets.only(top: 10.h, bottom: 7.h),
                  child: page.getIcon(false)),
              activeIcon: Container(
                width: 43.w,
                height: 30.h,
                margin: EdgeInsets.only(top: 10.h, bottom: 7.h),
                child: page.getIcon(true),
              ),
              label: '')
      ],
    );
  }
}

// class BottomBar extends StatefulWidget {
//   SubPage currentPage;
//   BottomBar(this.currentPage, {Key? key}) : super(key: key);

//   @override
//   _BottomBar createState() => _BottomBar();
// }

// class _BottomBar extends State<BottomBar> {
//   //目前選擇頁索引值
//   int _currentIndex = 0; //預設值

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         backgroundColor: Color.fromARGB(255, 189, 205, 214),
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: SubPage.PAGES.indexOf(currentPage),
//         selectedItemColor: Colors.black,
//         selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 10.sp),
//         unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 10.sp),
//         unselectedFontSize: 14.sp,
//         selectedFontSize: 14.sp,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemClick,
//         items: [
//           for (var page in SubPage.PAGES)
//             BottomNavigationBarItem(
//                 icon: Container(
//                     width: 43.w,
//                     height: 30.h,
//                     margin: EdgeInsets.only(top: 10.h, bottom: 7.h),
//                     child: page.getIcon(false)),
//                 activeIcon: Container(
//                   width: 43.w,
//                   height: 30.h,
//                   margin: EdgeInsets.only(top: 10.h, bottom: 7.h),
//                   child: page.getIcon(true),
//                 ),
//                 label: '')
//         ]);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('HKT線上教室'),
    //   ),
    //   body: pages[_currentIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首頁')),
    //       BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('聊天室')),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.account_circle), title: Text('個人資料')),
    //     ],
    //     currentIndex: _currentIndex, //目前選擇頁索引值
    //     fixedColor: Colors.amber, //選擇頁顏色
    //     onTap: _onItemClick, //BottomNavigationBar 按下處理事件
    //   ),
    // );
//   }

//   //BottomNavigationBar 按下處理事件，更新設定當下索引值
//   void _onItemClick(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
