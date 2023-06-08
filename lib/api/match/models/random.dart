class MatchResult {
  int id;
  String name;

  MatchResult.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "";
}
