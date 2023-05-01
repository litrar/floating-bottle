import 'package:floating_bottle/pages/subpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../components/bottom_bar.dart';
import '../theme/theme_bloc.dart';
import 'mail_route.dart';


class MailboxSubPage implements SubPage {
  MailboxSubPage();

  @override
  String get label => "任務";

  @override
  Widget getIcon(bool active) {
    return active
        ? Image.asset("assetfolder/icon/任務_黑.png",
            cacheHeight: 50, cacheWidth: 50)
        : Image.asset("assetfolder/icon/任務_白.png",
            cacheHeight: 50, cacheWidth: 50);
  }

  @override
  GoRoute get route => mail_route;
}

class MailboxPage extends StatefulWidget {
  MailboxPage({Key? key}) : super(key: key);

  State<MailboxPage> createState() => _MailboxPageState();
}


class _MailboxPageState extends State<MailboxPage> with TickerProviderStateMixin {
  late TabController _controller;
  final List<Tab> topTabs = <Tab>[
    new Tab(text: 'Friends'),
    new Tab(text: 'Pending'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TaskApi taskApi = context.read<TaskApi>();
    ThemeCubit themeCubit = context.read();
    return Scaffold(
      bottomNavigationBar: BottomBar(SubPage.PAGES as SubPage),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          toolbarHeight: 40.h,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: themeCubit.state.floatingButton),
          backgroundColor: themeCubit.state.floatingButton,
          titleSpacing: 0.0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset("assetfolder/logo_white.png",
                        width: 45.w, height: 45.h)),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 38.sp,
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>TaskSearchPage()));
              },
            ),
            IconButton(
                icon: Icon(Icons.notifications_outlined,
                    color: Colors.white, size: 38.sp),
                onPressed: () {
                }),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _controller,
              tabs: topTabs,
              labelStyle: TextStyle(fontSize: 15.sp),
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              labelColor: Color.fromARGB(255, 234, 127, 61),
              indicatorColor: Color.fromARGB(255, 255, 127, 61),
              indicatorSize: TabBarIndicatorSize.label,
            ),
            SizedBox(height: 10.h),
            // TaskList()
          ],
        ),
      ),
      floatingActionButton: _floatButton(context, themeCubit,),
      // floatingActionButton: _floatButton(context, themeCubit, taskApi)
    );
  }

  Widget _floatButton(
      BuildContext context, ThemeCubit themeCubit) {
      // BuildContext context, ThemeCubit themeCubit, TaskApi taskApi) {

    return InkWell(
        onTap: () {
          context.go("/tasks/create");
        },
        child: Container(
          decoration: BoxDecoration(
              color: themeCubit.state.floatingButton,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(2000)),
          child: Icon(Icons.add, size: 48.sp, color: Colors.white),
        ));
  }
}

// // class TaskList extends StatefulWidget {
// //   const TaskList({Key? key}) : super(key: key);

// //   @override
// //   _TaskListState createState() => _TaskListState();
// // }

// // // class _TaskListState extends State<TaskList> {
// //   static const _pageSize = 20;
// //   final PagingController<int, NormalTaskSimpleDTO> _controller =
// //       PagingController(firstPageKey: 0);

// //   @override
// //   void initState() {
// //     addControllerListener(context);
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     TaskApi taskApi = context.read();

// //     Set<String> doingTakenTaskIds = Set<String>();

// //     // 取得已接下的任務
// //     void getDoingTakenTask() async {
// //       var res = await taskApi.getDoingTakenTask();
// //       for (NormalTaskSimpleDTO task in res.data) {
// //         doingTakenTaskIds.add(task.normalTaskID);
// //       }
// //     }

// //     getDoingTakenTask();

// //     return Expanded(
// //         child: RefreshIndicator(
// //             onRefresh: () async {
// //               await Future.sync(() => _controller.refresh());
// //             },
// //             child: PagedListView(
// //                 pagingController: _controller,
// //                 builderDelegate: PagedChildBuilderDelegate<NormalTaskSimpleDTO>(
// //                     noMoreItemsIndicatorBuilder: (context) => Column(
// //                           children: [
// //                             Divider(
// //                               color: Colors.grey.shade400,
// //                               thickness: 1.h,
// //                             ),
// //                             SizedBox(height: 20.h)
// //                           ],
// //                         ),
// //                     itemBuilder: (context, task, i) {
// //                       return TaskCard(
// //                         hadTaken: doingTakenTaskIds.contains(task.normalTaskID),
// //                         task: task,
// //                         taskApi: taskApi,
// //                         refreshFunc: () {},
// //                       );
// //                     }))));
// //   }

// //   void addControllerListener(BuildContext context) {
// //     TaskApi taskApi = context.read();
// //     _controller.addPageRequestListener((pageKey) async {
// //       var res = await taskApi.getTasks(_pageSize, pageKey * _pageSize);
// //       if (res.isSuccess) {
// //         var taskList = res.data!;
// //         final isLastPage = taskList.length < _pageSize;
// //         if (isLastPage) {
// //           _controller.appendLastPage(taskList);
// //         } else {
// //           final nextPageKey = pageKey + 1;
// //           _controller.appendPage(taskList, nextPageKey);
// //         }
// //       }
// //     });
// //   }
// }
