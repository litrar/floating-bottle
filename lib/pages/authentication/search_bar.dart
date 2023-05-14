import 'package:floating_bottle/pages/authentication/language_level.dart';
import 'package:flutter/material.dart';


class SearchBarDelegate extends SearchDelegate<String> {
  late bool flag = false;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
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
    return LanguageLevel(item: query);
  }
  void showResults(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LanguageLevel(item: query),
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
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
                  children: [
                    TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey,fontSize: 20),),
                  ])),
          onTap: () {
            query = suggestionList[index];
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
