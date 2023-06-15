import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/user/profile.dart';

class ProfileCubit extends Cubit<Profile> {
  ProfileCubit(super.initialState) : super();

  void changeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeGender(String gender) {
    emit(state.copyWith(sex: gender));
  }

  void changeCity(String city) {
    emit(state.copyWith(city: city));
  }

  void changeInterest(List<String> interests) {
    emit(state.copyWith(interests: interests));
  }

  void changePersonality(List<String> personalities) {
    emit(state.copyWith(personalities: personalities));
  }

  void changeLanguage(List<String> languages) {
    emit(state.copyWith(languages: languages));
  }  
}
