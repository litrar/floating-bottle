import 'package:floating_bottle/pages/authentication/language_level.dart';
import 'package:floating_bottle/pages/authentication/language_level_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/account_detail_controller.dart';


class SearchBarDelegate extends SearchDelegate<String> {
  late bool flag = false;
  AccountDetailController accountDetailController = Get.put(AccountDetailController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, "error"));
  }

  @override
  Widget buildResults(BuildContext context) {
    return LanguageLevelResult(item: query);
  }
  void showResults(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LanguageLevelResult(item: query),
      ),
    );
    // super.showResults(context);
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20.sp),
                  children: [
                    TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                  ])),
          onTap: () {
            query = suggestionList[index];
            accountDetailController.toggleLanguage(query);
            print(query);
            showResults(context);
          },
        ));
  }
  final searchList = ['English','Spanish','French','Chinese','Arabic',
    'Hindi','Portuguese','Russian','Bengali','German','Japanese','Korean','Italian',
    'Dutch','Greek','Swedish','Norwegian','Danish','Polish','Turkish',
    'Thai','Indonesian','Filipino','Vietnamese','Irish','Swahili','Hebrew','Czech',
    'Finnish','Hungarian','Romanian','Bulgarian','Croatian','Serbian','Slovak','Slovenian',
    'Latvian','Lithuanian','Estonian','Icelandic'];
  final recentSuggest = ['English','Spanish','French','Chinese','Arabic',
    'Russian','German','Japanese','Korean','Italian', 'Dutch','Greek'];
}
