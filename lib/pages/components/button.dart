import 'package:floating_bottle/api/match/models/filter_fillout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatefulWidget {
  const MyButton(this.setStatePage,
      {super.key, required this.bName, this.f, this.category});
  final String bName;
  final void Function() setStatePage;
  final FilterFillOutData? f;
  final String? category;

  bool getBool() {
    return _MyButtonState().isSelected;
  }

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;
  String name = "";

  @override
  void initState() {
    // if (widget.bName == "deqe") {
    //   name = "defefef";
    // }
    name = widget.bName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: isSelected
          ? BoxDecoration(
              color: const Color.fromARGB(255, 59, 138, 178),
              borderRadius: BorderRadius.circular(35))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Colors.black)),
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {
            switch (widget.category) {
              case "college":
                setState(() {
                  widget.setStatePage();
                  isSelected = !isSelected;
                  widget.f?.college = 'NCCU';
                  print(widget.f!.all());
                });
                break;
              case "department":
                setState(() {
                  widget.setStatePage();
                  isSelected = !isSelected;
                  widget.f?.department = "MIS";
                  print(widget.f!.all());
                });
                break;
              case "sex":
                setState(() {
                  widget.setStatePage();
                  isSelected = !isSelected;
                  widget.f?.sex = 'F';
                  print(widget.f!.all());
                });
                break;
              case "personalities":
                setState(() {
                  widget.setStatePage();
                  isSelected = !isSelected;
                  widget.f?.personalties.add(widget.bName);
                  print(widget.f!.all());
                });
                break;
              case "interests":
                setState(() {
                  widget.setStatePage();
                  isSelected = !isSelected;
                  widget.f?.interests.add(widget.bName);
                  print(widget.f!.all());
                });
                break;
            }
          },
          child: Container(
              alignment: Alignment.center,
              child: Text(name,
                  style: isSelected
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: 'Bellota-Regular',
                          fontWeight: FontWeight.bold)
                      : TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontFamily: 'Bellota-Regular',
                          fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
