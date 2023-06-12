import '../../../pages/tool/time.dart';

class MatchedUserInfo {
  int id;
  String name;
  String? college;
  String? sex;  
  String? city;
  String? age;
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
        city = json['city'],
        age = json['age'],
        // avatar = json['avatar'],
        personalities = json['personality'],
        interests = json['interest'],
        isSelected = false;
}
