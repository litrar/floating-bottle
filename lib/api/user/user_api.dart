part of '../user.dart';

abstract class UserApi {
   factory UserApi(Dio dio) => _UserApi(dio);
   Future<HttpRes<Profile>> getProfile(int id);
   Future<bool> editProfile(int userId, Profile p);
  
}