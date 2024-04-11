import 'package:dio/dio.dart';
import 'package:floating_bottle/api/match/models/filter_fillout_data.dart';
import 'package:floating_bottle/api/user.dart';
import 'package:floating_bottle/pages/authentication/login.dart';
import 'package:floating_bottle/pages/components/bottom_bar.dart';
import 'package:floating_bottle/pages/components/error_page.dart';
import 'package:floating_bottle/pages/contact_page/contact.dart';
import 'package:floating_bottle/pages/subpage.dart';
import 'package:floating_bottle/pages/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'api/contact.dart';
import 'api/letter.dart';
import 'api/match.dart';
import 'controllers/account_detail_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AccountDetailController accountDetailController = Get.put(AccountDetailController());
  final Dio _dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: 10000),
      receiveTimeout: Duration(milliseconds: 10000),
      sendTimeout: Duration(milliseconds: 10000),
      validateStatus: (_) => true))
      ..interceptors.add(LogInterceptor(responseBody: true));
  late GetMaterialApp _getMaterialApp;

  MyApp({Key? key}) {
    _getMaterialApp = GetMaterialApp(
      initialRoute: Login.route.name,
      getPages: [
        GetPage(name: Login.route.name, page: () => Login()),
        for (var page in SubPage.PAGES)
          GetPage(name: page.route.name, page: () => ContactPage(), arguments: BottomBar.userId)
      ],
      unknownRoute: GetPage(
        name: '/error',
        page: () => ErrorPage("uncaught error"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (_) => ThemeCubit())],
          child: MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (_) => LetterApi(_dio)),
              RepositoryProvider(create: (_) => MatchApi(_dio)),
              RepositoryProvider(create: (_) => ContactApi(_dio)),
              RepositoryProvider(create: (_) => UserApi(_dio)),
              RepositoryProvider(
                create: (_) => FilterFillOutData(
                  college: '',
                  department: '',
                  sex: '',
                  city: '',
                  languages: [],
                  personalties: [],
                  interests: [],
                ),
              ),
            ],
            child: _app(),
          ),
        );
      },
    );
  }

  Widget _app() {
    return _getMaterialApp;
  }
}
