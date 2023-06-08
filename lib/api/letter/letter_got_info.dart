import '../../pages/tool/time.dart';

class LetterGot {
  int letterId;
  int matchId;
  String topic;
  String content;
  DateTime time;
  int matcherId;
  int matchedAccountId;

  LetterGot.fromJson(Map<String, dynamic> json)
      : letterId = json["letterId"] ?? "",
        matchId = json["matchId"] ?? "",
        topic = json["topic"] ?? "",
        content = json["content"] ?? "",
        time = parseTime(json["time"]),
        matcherId = json["macherId"] ?? "",
        matchedAccountId = json["matchedAccountId"];
}
