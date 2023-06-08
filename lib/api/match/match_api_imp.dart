part of '../match.dart';

class _MatchApi implements MatchApi {
  final Dio _dio;

  _MatchApi(this._dio);
  
  @override
  Future<HttpRes<List<MatchResult>>> getFilterMatch() {
    // TODO: implement getFilterMatch
    throw UnimplementedError();
  }
  
  @override
  Future<HttpRes<MatchResult>> getRandomMatch() {
    // TODO: implement getRandomMatch
    throw UnimplementedError();
  }
  
  @override
  Future<HttpRes<MatchResult>> getSearchIDMatch() {
    // TODO: implement getSearchIDMatch
    throw UnimplementedError();
  }

  
  

}

