class Profile {
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
  String? age;

  Profile({
    required this.email,
    required this.id,
    required this.name,
    this.sex,
    this.college,
    this.age,
    this.city,
    this.personalities,
    this.interests,
  });

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['accId'] ?? 0,
        email = json['address'] ?? "",
        name = json['name'],
        college = json['college'] ?? "",
        department = json['department'] ?? "",
        sex = json['sex'] ?? "",
        city = json['city'] ?? "",
        languages = json['language'] ?? [],
        personalities = json['personality'] ?? [],
        interests = json['interest'] ?? [],
        age = json['age'] ?? "",
        bdate = DateTime.now();

  static Profile? tryCast(dynamic object) {
    if (object is Map<String, dynamic>) return Profile.fromJson(object);
    return null;
  }
}
