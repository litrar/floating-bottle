import 'package:floating_bottle/api/match/models/filter_fillout_data.dart';
import 'package:floating_bottle/pages/match_page/match_filter.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterRepository extends StatelessWidget {
  const FilterRepository({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return RepositoryProvider<FilterFillOutData>(
        create: (_) => FilterFillOutData(
            college: '',
            department: '',
            sex: '',
            city: '',
            languages: [],
            personalties: [],
            interests: []),
        child: MatchFilterPage(),
      );
    });
  }
}
