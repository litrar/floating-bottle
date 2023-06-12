part of '../match.dart';

class _MatchApi implements MatchApi {
  final Dio _dio;
  final headers = {'ngrok-skip-browser-warning': 'true'};

  _MatchApi(this._dio);

  @override
  Future<HttpRes<MatchResult>> getRandomMatch() async {
    var req = await _dio.get(
        "https://0c28-36-229-146-249.ngrok-free.app/api/Users/random",
        options: Options(headers: headers));
    print(req.data);
    return HttpRes<MatchResult>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchResult.fromJson);
  }
  
  @override
  Future<HttpRes<List<MatchResult>>> getFilterMatch(FilterFillOutData f) async {
    var req = await _dio.post(
        "https://0c28-36-229-146-249.ngrok-free.app/api/Users/filter",
        data: {
          'college': f.getCollege(),
          'department': f.getDepartment(),
          'sex': f.getSex(),
          'city': f.getCity(),
          'language': f.getLanguages(),
          'personality': f.getInterests(),
          'interest': f.getInterests()
        },
        options: Options(headers: headers));

    List<MatchResult> list = <MatchResult>[];
    print(req.data);
    if (req.data == null) return HttpRes.failed();
    if (req.statusCode == 200) {
      print('req.statusCode = 200');
      dynamic rawListMap = req.data;
      if (rawListMap is List<dynamic>) {
        for (var value in rawListMap) {
          var o = MatchResult.tryCast(value);
          if (o != null) list.add(o);
        }
      }
      return HttpRes(
          isSuccess: true,
          code: req.statusCode,
          message: 'We have no message',
          data: list);
    } else {
      print(req.statusCode);
      print('fail in match_api_imp.dart');
      return HttpRes.failed(
          errMsg: 'error for getFilterMatch', code: req.statusCode);
    }
  }

  @override
  Future<HttpRes<MatchResult>> getSearchIDMatch(int id) async {
    var req = await _dio.get(
        "https://0c28-36-229-146-249.ngrok-free.app/api/Users/$id",
        options: Options(headers: headers));
    print(req.data + 'sdk');
    print(req.data == String);
    return HttpRes<MatchResult>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchResult.fromJson);
  }

  @override
  Future<HttpRes<MatchedUserInfo>> showUserById(int userId) async {
    var req = await _dio.get(
        "https://0c28-36-229-146-249.ngrok-free.app/api/Users/ShowUserById/$userId",
        options: Options(headers: headers));
    //print(req.data);
    return HttpRes<MatchedUserInfo>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchedUserInfo.fromJson);
  }
  
  @override
  Future<HttpRes<MatchedUserInfo>> insertUserPair(int userId1, int userId2) {
    // TODO: implement insertUserPair
    throw UnimplementedError();
  }
}
