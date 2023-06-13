part of '../contact.dart';

abstract class ContactApi {
   factory ContactApi(Dio dio) => _ContactApi(dio);
   Future<HttpRes> getFriends(int userId);
   Future<HttpRes> getPendings(int userId);
  
}