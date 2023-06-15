part of '../letter.dart';

class LetterSent {
  int matcherId;
  int matchedAccountId;
  String topic;
  String content;
  String? attType;
  DateTime time;

  LetterSent(
      {required int matcherId,
      required int matchedAccountId,
      required String topic,
      required String content,
      this.attType,
      required DateTime time})
      : matcherId = matcherId,
        matchedAccountId = matchedAccountId,
        topic = topic,
        content = content,
        time = time;

  Future<FormData> toData() async {
    return FormData.fromMap({
      "MacherId": matcherId,
      "MatchedAccountId": matchedAccountId,
      "Topic": topic,
      "Content": content,
      "AttType": attType,
      "Time":time
    });
  }
}
