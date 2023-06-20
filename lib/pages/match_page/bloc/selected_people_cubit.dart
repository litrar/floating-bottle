import 'package:floating_bottle/api/match/models/matched_user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedUsersCubit extends Cubit<List<MatchedUserInfo>> {
  SelectedUsersCubit(super.initialState) : super();

  void set_selected(int userID, bool opposite) {
    List<MatchedUserInfo> newUsers = [];

    for (var user in state) {
      newUsers.add(user);
      if (user.id == userID) {
        user.isSelected = opposite;
      } else {
        user.isSelected = false;
      }
    }
    emit(newUsers);
  }

  MatchedUserInfo? getSelect() {
    for (var user in state) {
      if (user.isSelected) {
        return user;
      }
    }
  }
}
