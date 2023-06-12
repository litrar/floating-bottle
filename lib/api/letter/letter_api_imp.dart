part of '../letter.dart';



class _LetterApi implements LetterApi {
  final Dio _dio;

  _LetterApi(this._dio);

  @override
  Future<HttpRes<List<LetterGot>>> getLetter(int matcherId, int matchedAccountId) async {
    var req =
    //這邊要再加matcher, matched的變數到網址裡面
        await _dio.get("https://ecc3-111-241-177-116.ngrok-free.app/api/Letter?matcher=$matcherId&matched=$matchedAccountId");
    if (req.statusCode == 200) {
      final List<dynamic> jsonData = req.data;
      final letters = jsonData
          .map((json) => LetterGot.fromJson(json))
          .toList()
          .cast<LetterGot>();
      return HttpRes<List<LetterGot>>(
        code: req.statusCode,
        isSuccess: true,
        message: 'Success',
        data: letters,
      );
    } else {
      throw Exception('Failed to fetch letters');
    }

  }

  @override
  Future<bool> sendLetter(LetterSent data) async{
    var res = await _dio.post("https://ecc3-111-241-177-116.ngrok-free.app/api/Letter",
        data: await data.toData(),
        options: Options(headers: {'Content-Type': 'multipart/form-data'}));
    return res.statusCode == 200;
  }
  
  @override
  Future<HttpRes> deleteLetter(int letterId) async{
    var res = await _dio.delete("https://ecc3-111-241-177-116.ngrok-free.app/api/Letter/$letterId");
    return HttpRes(
        isSuccess: res.statusCode == 200,
        message: "已刪除",
        code: res.statusCode);
  }

}
