import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15.w)),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color.fromARGB(255, 122, 161, 216),
                        size: 25.sp,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  child: const Text('This is edit_name_page'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
