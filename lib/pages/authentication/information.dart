import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gender.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  late DateTime selectedDateTime;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assetsfolder/information_background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 15, left: 310),
              child: TextButton(
                onPressed: () {
                  context.go("/personal");
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )),
          _schoolField(),
          _cityField(),
          _birthField(),
          _continueButton(),
        ],
      )
    ]));
  }

  Widget _schoolField() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 290),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Align(
            widthFactor: 2.3,
            child: Icon(
              Icons.school,
              size: 30,
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " School",
          hintStyle: TextStyle(fontSize: 22, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        ),
        style: const TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3,
      ),
    );
  }

  Widget _cityField() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Align(
            widthFactor: 2.3,
            child: Icon(
              Icons.location_city,
              size: 30,
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " City",
          hintStyle: TextStyle(fontSize: 22, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        ),
        style: const TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3,
      ),
    );
  }

  Widget _birthField() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Align(
            widthFactor: 1.5,
            child: IconButton(
                onPressed: () async {
                  var result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1923, 01),
                      lastDate: DateTime(2023, 12));
                  if (result != null) {
                    setState(() {
                      selectedDateTime = result;
                    });
                  }
                  ;
                },
                icon: const Icon(
                  Icons.calendar_month,
                  size: 30,
                )),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: " Date of birth",
          hintStyle: TextStyle(fontSize: 22, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        ),
        style: const TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        cursorWidth: 3,
      ),
    );
  }

  Widget _continueButton() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 40, bottom: 40),
      width: 350,
      height: 70,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Gender();
              },
            ),
          );
        },
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
