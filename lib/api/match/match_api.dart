part of '../match.dart';

abstract class MatchApi {
   factory MatchApi(Dio dio) => _MatchApi(dio);
  Future<HttpRes<MatchResult>> getRandomMatch();
Future<HttpRes<List<MatchResult>>> getFilterMatch();
Future<HttpRes<MatchResult>> getSearchIDMatch();

}