part of '../user.dart';

class _UserApi implements UserApi {
  final Dio _dio;
  final headers = {'ngrok-skip-browser-warning': 'true'};
  _UserApi(this._dio){
    _dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<HttpRes<Profile>> getProfile(int id) async {
    var req = await _dio.get("$baseUrl/api/profile/$id",
        options: Options(headers: headers));
    print(req.data);
    return HttpRes<Profile>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: Profile.fromJson);
  }

  @override
  Future<bool> editProfile(int userId, Profile p) async {
    var res = await _dio.put("$baseUrl/api/profile/$userId",
        data: {userId: p.id}, options: Options(headers: headers));
    return res.statusCode == 200;
  }
}
