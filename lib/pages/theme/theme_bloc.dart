import 'package:floating_bottle/pages/theme/std_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_theme.dart';

class ThemeCubit extends Cubit<ColorTheme> {
  ThemeCubit() : super(StdTheme());

  void setTheme(ColorTheme colorTheme){
    emit(colorTheme);
  }

}
