part of '../letter.dart';

abstract class LetterApi {
   factory LetterApi(Dio dio) => _LetterApi(dio);

  Future<HttpRes<LetterGot>> getLetter(int matcher, int matched);
  Future<bool> sendLetter(LetterSent createData);
  Future<HttpRes> deleteLetter(int letterId);
}

