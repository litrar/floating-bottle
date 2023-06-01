import 'package:floating_bottle/pages/mailbox_page/new_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedUsersCubit extends Cubit<List<NewUser>> {
  SelectedUsersCubit(super.initialState) : super();

  void set_selected(int userID, bool isSelected) {
    print("selected\n");
    List<NewUser> newUsers = [];

    for (var user in state) {
      newUsers.add(user);
      if (user.id == userID) {
        user.isSelected = isSelected;
      } else
        user.isSelected = false;
    }
    emit(newUsers);
  }

  NewUser? getSelect() {
    for (var user in state) {
      if (user.isSelected) {
        return user;
      }
    }
  }
}
