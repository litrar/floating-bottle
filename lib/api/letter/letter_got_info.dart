class LetterGot {
  int letterId;
  int matchId;
  String topic;
  String content;
  DateTime time;
  int matcherId;
  String matcherName;
  int matchedAccountId;
  String matchedAccName;


  LetterGot.fromJson(Map<String, dynamic> json)
      : letterId = json["letterId"] ?? 0,
        matchId = json["matchId"] ?? 0,
        topic = json["topic"] ?? "",
        content = json["content"] ?? "",
        time = DateTime.parse(json["time"] ?? ''),
        matcherId = json["macherId"] ?? 0,
        matcherName = json["matcherName"] ?? '',
        matchedAccountId = json["matchedAccountId"] ?? 0,
        matchedAccName = json["matchedAccName"] ?? '';
}
