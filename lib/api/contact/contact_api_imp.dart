part of '../contact.dart';

class _ContactApi implements ContactApi {
  final Dio _dio;
  final headers = {'ngrok-skip-browser-warning': 'true'};
  _ContactApi(this._dio);
  @override
  //回傳list of 朋友們的id
  Future<HttpRes> getFriends(int userId) async {
    var res = await _dio.get(
        "$baseUrl/api/Phonebook/MatchedPairs/$userId", options: Options(headers: headers));

    List<int> list = <int>[];
    dynamic rawListMap = res.data;
    if (rawListMap is List<dynamic>) {
      for (var id in rawListMap) {
        if (id != null) {
          list.add(id);
          print(id);
        }
      }
    }

    return HttpRes(
        isSuccess: res.statusCode == 200,
        code: res.statusCode,
        message: 'message for getFriends api',
        data: list);
  }

  @override
  Future<HttpRes> getPendings(int userId) async {
    var res = await _dio.get(
        "$baseUrl/api/Phonebook/Pending/$userId", options: Options(headers: headers));

    List<int> list = <int>[];
    dynamic rawListMap = res.data;
    if (rawListMap is List<dynamic>) {
      for (var id in rawListMap) {
        if (id != null) {
          list.add(id);
          print(id);
        }
      }
    }

    return HttpRes(
        isSuccess: res.statusCode == 200,
        code: res.statusCode,
        message: 'message for getPendings api',
        data: list);
  }
}
