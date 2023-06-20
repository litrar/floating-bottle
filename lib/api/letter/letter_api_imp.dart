part of '../letter.dart';

class _LetterApi implements LetterApi {
  final Dio _dio;
  final headers = {'ngrok-skip-browser-warning': 'true'};
  _LetterApi(this._dio);

  @override
  Future<HttpRes<List<LetterGot>>> getLetter(int matcherId, int matchedAccountId) async {
    var req =
    //這邊要再加matcher, matched的變數到網址裡面
        await _dio.get("$baseUrl/api/Letter/GetLetter/$matcherId/$matchedAccountId", options: Options(headers: headers));
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
  Future<bool> sendLetter(LetterSent l) async{
    var res = await _dio.post("$baseUrl/api/Letter/SendLetter",
        data:{
          // 'letterId': l.getLetterId(),
          // 'matchId': l.getMatchId(),
          'topic': l.getTopic(),
          'content': l.getContent(),
          'time': l.getTime(),
          // 'att': l.getImage(),
          'matcherId': l.getmatcherId(),
          'matcherName': l.getMatcherName(),
          'matchedAccountId': l.getMatchedAccId(),
          'matchedAccName': l.getMatchedAccName()
        },
        options: Options(headers: {'ngrok-skip-browser-warning': 'true'},));
    return res.statusCode == 200;
  }
  
  @override
  Future<HttpRes> deleteLetter(int letterId) async{
    var res = await _dio.delete("$baseUrl/api/Letter/$letterId");
    return HttpRes(
        isSuccess: res.statusCode == 200,
        message: "已刪除",
        code: res.statusCode);
  }

}
