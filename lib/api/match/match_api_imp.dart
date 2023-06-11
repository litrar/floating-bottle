part of '../match.dart';

class _MatchApi implements MatchApi {
  final Dio _dio;

  _MatchApi(this._dio);

  @override
  Future<HttpRes<MatchResult>> getRandomMatch() async {
    var req =
        //這邊要再加matcher, matched的變數到網址裡面
        await _dio.get(
            "https://ecc3-111-241-177-116.ngrok-free.app/api/Users/random");
    print(req.data);
    return HttpRes<MatchResult>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchResult.fromJson);
  }
// var res = await _dio.post("$baseUrl/$namespace/create",
//         data: await createData.toFormData(),
//         options: Options(headers: {'Content-Type': 'multipart/form-data'}));
// return res.statusCode == 200;

// var response = await _dio.post("$baseUrl/$namespace/follow",
//      data: {"taskId": taskId, "followValue": follow});
// return response.statusCode == 200;  @override

  @override
  Future<HttpRes<List<MatchResult>>> getFilterMatch(FilterFillOutData f) async {
    var req = await _dio.get(
        "https://ecc3-111-241-177-116.ngrok-free.app/api/Users/filter",
        queryParameters: {
          'college': f.getCollege(),
          'department': f.getDepartment(),
          'sex': f.getSex(),
          'city': f.getCity(),
          'languages': f.getLanguages(),
          'personalities': f.getInterests(),
          'interests': f.getInterests()
        });

    List<MatchResult> list = <MatchResult>[];
    print(req.data);
    if (req.data == null) return HttpRes.failed();
    if (req.statusCode == 200) {
      dynamic rawListMap = req.data;
      if (rawListMap is List<dynamic>) {
        for (var value in rawListMap) {
          var o = MatchResult.tryCast(value);
          if (o != null) list.add(o);
        }
      }
      return HttpRes(
          isSuccess: req.data["isSuccess"],
          code: req.statusCode,
          message: req.data["message"],
          data: list);
    }else {
      return HttpRes.failed(errMsg: req.data["message"], code: req.statusCode);
    }
  }

  @override
  Future<HttpRes<MatchResult>> getSearchIDMatch(int id) async {
    var req = await _dio
        .get("https://ecc3-111-241-177-116.ngrok-free.app/api/Users/$id");
    print(req.data);
    return HttpRes<MatchResult>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: MatchResult.fromJson);
  }
}
