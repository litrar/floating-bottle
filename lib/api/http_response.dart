class HttpRes<T> {
  final int code;
  final bool isSuccess;
  final String? message;

  final T? data;

  HttpRes.fromJson(Map<String, dynamic> json,
      {T? Function(Map<String, dynamic>)? dataDecodeFunc, int? code})
      : code = code ?? json["code"] ?? -1,
        isSuccess = json["isSuccess"] ?? false,
        message = json["message"],
        data = (dataDecodeFunc != null &&
                json["data"] != null &&
                json["data"] is Map<String, dynamic>)
            ? dataDecodeFunc(json["data"])
            : json["data"];

  HttpRes({bool? isSuccess, String? message, T? data, int? code})
      : code = code ?? -1,
        isSuccess = isSuccess ?? false,
        message = message,
        data = data;

  HttpRes.failed({String? errMsg, int? code})
      : message = errMsg,
        code = code ?? -1,
        isSuccess = false,
        data = null;

  HttpRes.success({this.data, this.message})
      : code = 200,
        isSuccess = true;
}
