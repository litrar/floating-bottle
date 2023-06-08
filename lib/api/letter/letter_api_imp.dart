part of '../letter.dart';



class _LetterApi implements LetterApi {
  final Dio _dio;

  _LetterApi(this._dio);

  @override
  Future<HttpRes<LetterGot>> getLetter(int matcher, int matched) async {
    var req =
    //這邊要再加matcher, matched的變數到網址裡面
        await _dio.get("https://ecc3-111-241-177-116.ngrok-free.app/api/Letter");
    print(req.data);
    return HttpRes<LetterGot>.fromJson(req.data,
        code: req.statusCode, dataDecodeFunc: LetterGot.fromJson);
  }

  @override
  Future<bool> sendLetter(LetterSent data) async{
    var res = await _dio.post("https://ecc3-111-241-177-116.ngrok-free.app/api/Letter",
        data: await data.toData(),
        options: Options(headers: {'Content-Type': 'multipart/form-data'}));
    return res.statusCode == 200;
  }

}
