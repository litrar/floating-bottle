import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'information.dart';
import 'interest.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool wpressed = true;
  bool mpressed = true;
  bool cpressed = true;

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
            margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Information();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                TextButton(
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
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, top: 80),
            child: const Text(
              "I'm a...",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
          ),
          _womanButton(),
          _manButton(),
          _continueButton(),
        ],
      )
    ]));
  }

  Widget _womanButton() {
    return TextButton(
        onPressed: () {
          if (mpressed == true) {
            setState(() {
              wpressed = !wpressed;
            });
          } else {
            setState(() {
              wpressed == wpressed;
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          height: 75,
          width: 340,
          decoration: wpressed
              ? BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Woman",
              style: wpressed
                  ? const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }

  Widget _manButton() {
    return TextButton(
        onPressed: () {
          if (wpressed == true) {
            setState(() {
              mpressed = !mpressed;
            });
          } else {
            setState(() {
              mpressed == mpressed;
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 75,
          width: 340,
          decoration: mpressed
              ? BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Man",
              style: mpressed
                  ? const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }

  Widget _continueButton() {
    return TextButton(
        onPressed: () {
          if (wpressed == false || mpressed == false) {
            setState(() {
              cpressed = !cpressed;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Interest();
                },
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 300),
          height: 75,
          width: 340,
          decoration: wpressed && mpressed
              ? BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(35))
              : BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(35)),
          alignment: Alignment.center,
          child: Text("Continue",
              style: wpressed && mpressed
                  ? const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
        ));
  }
}
