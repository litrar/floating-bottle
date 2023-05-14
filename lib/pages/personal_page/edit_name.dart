import 'package:flutter/material.dart';

import '../components/bottom_bar.dart';
import '../subpage.dart';

class EditNamePage extends StatelessWidget {
  const EditNamePage({super.key});
  @override
  Widget build(BuildContext context) {
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
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Text('this is edit_name_page'),
          )
        ],
      ),
    );
  }
}
