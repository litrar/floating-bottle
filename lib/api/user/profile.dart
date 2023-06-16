import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  int id;
  String email;
  String? name;
  String? college;
  String? department;
  String? sex;
  String? city;
  DateTime? bdate;
  List<String>? languages;
  List<String>? personalities;
  List<String>? interests;
  int? age;

  Profile({
    required this.email,
    required this.id,
    required this.name,
    this.sex,
    this.college,
    this.department,
    this.bdate,
    this.age,
    this.city,
    this.languages,
    this.personalities,
    this.interests,
  });

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['accId'] ?? "",
        email = json['address'] ?? "",
        name = json['name'],
        college = json['college'] ?? "",
        department = json['department'] ?? "",
        sex = json['sex'] ?? "",
        city = json['city'] ?? "",
        languages = (json['language']as List).cast(),
        personalities = (json['personality']as List).cast(),
        interests = (json['interest']as List).cast(),
        age = json['age'] ?? "",
        bdate = DateTime.tryParse(json['bdate'] ?? "");

  Future<FormData> toFormData() async {
    // List<RecreatableMultipartFile> multiImages = <RecreatableMultipartFile>[];
    // images.forEach((element) async {
    //   multiImages.add(RecreatableMultipartFile.fromFileSync(element));
    // });
    return FormData.fromMap(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": id,
      "name": name,
      "college": college,
      "department": department,
      "sex": sex,
      "city": city,
      "personality": personalities,
      "age": age,
      "address": email,
      "language": languages,
      "interests": interests,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        name,
        college,
        department,
        sex,
        city,
        bdate,
        languages,
        personalities,
        interests,
        age,
      ];

  Profile copyWith(
      {int? id,
      String? email,
      String? name,
      String? college,
      String? department,
      String? sex,
      String? city,
      DateTime? bdate,
      List<String>? languages,
      List<String>? personalities,
      List<String>? interests,
      int? age}) {
    return Profile(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        college: college ?? this.college,
        department: department ?? this.department,
        sex: sex ?? this.sex,
        city: city ?? this.city,
        bdate: bdate ?? this.bdate,
        languages: languages ?? this.languages,
        personalities: personalities ?? this.personalities,
        interests: interests ?? this.interests,
        age: age ?? this.age);
  }
}
