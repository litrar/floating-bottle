import 'package:floating_bottle/api/user/user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedUsersCubit extends Cubit<List<UserInfo>> {
  SelectedUsersCubit(super.initialState) : super();

  void set_selected(int userID, bool isSelected) {
    print("selected\n");
    List<UserInfo> newUsers = [];

    for (var user in state) {
      newUsers.add(user);
      if (user.id == userID) {
        user.isSelected = isSelected;
      } else
        user.isSelected = false;
    }
    // emit(newUsers);
  }

  UserInfo? getSelect() {
    for (var user in state) {
      if (user.isSelected) {
        return user;
      }
    }
  }
}
