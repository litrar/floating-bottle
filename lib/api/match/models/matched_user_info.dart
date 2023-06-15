
class MatchedUserInfo {
  int id;
  String name;
  String? college;
  String? sex;  
  String? city;
  int? age;
  String? avatar;
  List<String>? personalities;
  List<String>? interests;
  // DateTime? bdate;
  // String? address;

  bool isSelected;

  MatchedUserInfo(
      {required this.id,
      required this.name,
      required this.avatar,
      this.sex,
      this.college,
      this.age,
      this.city,
      this.personalities,
      this.interests,
      required this.isSelected});

  MatchedUserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        college = json['college'],
        sex = json['gender'],
        city = (json['city'] as String).replaceAll(" ", ""),
        age = json['age'],
        // avatar = json['avatar'],
        personalities = (json['personality'] as List).cast(),
        interests = (json['interest']as List).cast(),
        avatar = json["avatar"] ?? 'assetsfolder/friend1.jpg',
        isSelected = false;
}
