part of '../match.dart';

class _MatchApi implements MatchApi {
  final Dio _dio;
  final headers = {'ngrok-skip-browser-warning': 'true'};

  _MatchApi(this._dio);

  @override
  Future<HttpRes<MatchResult>> getRandomMatch() async {
    var req = await _dio.get("$baseUrl/api/Users/random",
        options: Options(headers: headers));
    print(req.data);
    return HttpRes<MatchResult>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchResult.fromJson);
  }

  @override
  Future<HttpRes<List<MatchResult>>> getFilterMatch(FilterFillOutData f) async {
    var req = await _dio.post("$baseUrl/api/Users/filter",
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
    print('${req.data} at getFilterMatch');
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
    var req = await _dio.get("$baseUrl/api/Users/$id",
        options: Options(headers: headers));
    if (req.statusCode == 200) {
      return HttpRes<MatchResult>.fromJson(req.data,
          code: req.statusCode, dataDecodeFunc: MatchResult.fromJson);
    } else {
      return HttpRes.failed(
          errMsg: 'error for getSearchIDMatch', code: req.statusCode);
    }
  }

  @override
  //回傳包有user的資料的MatchedUserInfo
  Future<HttpRes<MatchedUserInfo>> showUserById(int userId) async {
    var req = await _dio.get("$baseUrl/api/Users/ShowUserById/$userId",
        options: Options(headers: headers));
    print('${req.data} at showUserById');
    return HttpRes<MatchedUserInfo>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchedUserInfo.fromJson);
  }

  @override
  Future<bool> insertUserPair(int userId1, int userId2) async {
    var req = await _dio.post(
        "$baseUrl/api/Users/InsertUserPair/$userId1/$userId2",
        options: Options(headers: headers));
    return req.statusCode == 200;
  }
}
