import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as LI;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: LI.LoadingIndicator(
          indicatorType: LI.Indicator.ballSpinFadeLoader,
          colors: const [Colors.grey],
        ),
        height: 50.h,
      ),
    );
  }
}
