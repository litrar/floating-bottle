import '../../pages/tool/time.dart';

class UserInfo {
  int id;
  String name;
  String? college;
  String? department;
  String? sex;

  String? avatar;
  String? age;
  String? city;
  // DateTime? bdate;
  // String? address;

  List<String>? personalities;
  List<String>? interests;

  bool isSelected;

  UserInfo(
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

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['userId'],
        name = json['name'],
        college = json['college'],
        department = json['department'],
        sex = json['sex'],
        city = json['city'],
        age = json['age'],
        avatar = json['avatar'],
        personalities = json['personality'],
        interests = json['interest'],
        isSelected = false;
}
