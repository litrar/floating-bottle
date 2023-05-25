class NewUser {
  String? email;
  String name;
  String? avatar;
  String? gender;

  String? school;
  String? phone;
  String? age;
  String? city;

  List<String>? personalities;
  List<String>? interests;

  bool? isSelected;

  NewUser(
      {this.email,
      required this.name,
      required this.avatar,
      this.gender,
      this.school,
      this.phone,
      this.age,
      this.city,
      this.personalities,
      this.interests,
      this.isSelected
      });
}
