part of '../letter.dart';

abstract class LetterApi {
   factory LetterApi(Dio dio) => _LetterApi(dio);

  Future<HttpRes<List<LetterGot>>> getLetter(int matcherId, int matchedAccountId);
  Future<bool> sendLetter(LetterSent createData);
  Future<HttpRes> deleteLetter(int letterId);
}

