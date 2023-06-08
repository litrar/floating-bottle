part of '../letter.dart';

class LetterSent {
  int matcherId;
  int matchedAccountId;
  String topic;
  String content;
  String attType;
  DateTime time;

  LetterSent(
      {required int matcherId,
      required int matchedAccountId,
      required String topic,
      required String content,
      required String attType,
      required DateTime time})
      : matcherId = matcherId,
        matchedAccountId = matchedAccountId,
        topic = topic,
        content = content,
        attType = attType ?? 'null',
        time = time;

  Future<FormData> toData() async {
    return FormData.fromMap({
      "macherId": matcherId,
      "matchedAccountId": matchedAccountId,
      "topic": topic,
      "content": content,
      "attType": attType,
      "time":time
    });
  }
}
