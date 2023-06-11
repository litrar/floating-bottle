class MatchResult {
  int id;
  String name;
  bool? isSelected;

  MatchResult.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "";

  static MatchResult? tryCast(dynamic object){
    if(object is Map<String,dynamic>)
      return MatchResult.fromJson(object);
    return null;
  }
}
