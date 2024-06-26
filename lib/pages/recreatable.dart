import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';

class RecreatableMultipartFile extends MultipartFile {

  RecreatableMultipartFile(
    Stream<List<int>> stream,
    int length,
    String? filename,
    this.filePath, {
    MediaType? contentType,
  }) : super(stream, length, filename: filename, contentType: contentType);
  final String filePath;

  // ignore: prefer_constructors_over_static_methods
  static RecreatableMultipartFile fromFileSync(
    String filePath, {
    String? filename,
    MediaType? contentType,
  }) {
    filename ??= p.basename(filePath);
    final file = File(filePath);
    final length = file.lengthSync();
    final stream = file.openRead();
    return RecreatableMultipartFile(
      stream,
      length,
      filename,
      filePath,
      contentType: contentType,
    );
  }

  RecreatableMultipartFile recreate() => fromFileSync(
        filePath,
        filename: filename,
        contentType: contentType,
      );
}