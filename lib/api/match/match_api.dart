part of '../match.dart';

abstract class MatchApi {
factory MatchApi(Dio dio) => _MatchApi(dio);
Future<HttpRes<MatchResult>> getRandomMatch();
Future<HttpRes<List<MatchResult>>> getFilterMatch(FilterFillOutData f);
Future<HttpRes<MatchResult>> getSearchIDMatch(int id);
Future<HttpRes<MatchedUserInfo>> showUserById(int userId);
Future<bool> insertUserPair(int userId1, int userId2);


}