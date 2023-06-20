part of '../letter.dart';

class LetterSent {
  int? letterId;
  int? matchId;
  String topic;
  String content;
  DateTime time;
  String? image;
  int matcherId;
  String? matcherName;
  int matchedAccountId;
  String? matchedAccName;

  LetterSent(
      {this.letterId,
      this.matchId,
      this.matcherName,
      this.matchedAccName,
      this.image,
      required int matcherId,
      required int matchedAccountId,
      required String topic,
      required String content,
      required DateTime time})
      : matcherId = matcherId,
        matchedAccountId = matchedAccountId,
        topic = topic,
        content = content,
        time = time;

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "MacherId": matcherId,
      "MatchedAccountId": matchedAccountId,
      "Topic": topic,
      "Content": content,
      "attType": image,
      "time": time
    });
  }

  int getLetterId() {
    return letterId!;
  }

  int getMatchId() {
    return matchId!;
  }

  String getTopic() {
    return topic;
  }

  String getContent() {
    return content;
  }

  String getTime() {
    return standardFormat(time);
  }

  String getImage() {
    return image!;
  }

  int getmatcherId() {
    return matcherId;
  }

  String getMatcherName() {
    if (matcherName == null) {
      return "";
    } else {
      return matcherName!;
    }
  }

  int getMatchedAccId() {
    return matcherId;
  }

  String getMatchedAccName() {
    if (matchedAccName == null) {
      return "";
    } else {
      return matchedAccName!;
    }
  }
}
