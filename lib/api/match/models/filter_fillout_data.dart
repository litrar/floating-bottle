class FilterFillOutData {
  String college;
  String department;
  String sex;
  String city;
  List<String> languages;
  List<String> personalties;
  List<String> interests;

  FilterFillOutData({
    required String college,
    required String department,
    required String sex,
    required String city,
    required List<String> languages,
    required List<String> personalties,
    required List<String> interests,
  })  : college = college,
        department = department,
        sex = sex,
        city = city,
        languages = languages,
        personalties = personalties,
        interests = interests;

  String all() {
    String l = '';
    languages.map((e) => l = l + e).toList();
    String p = '';
    for (var person in personalties) p = p + person;
    String i = '';
    for (var intere in interests) i = i + intere;

    int lenth = interests.length;

    return '$college\n$department\n$sex\n$city\n$l\n$p\n$i\n$lenth';
  }

  String getCollege() {
    return this.college;
  }

  String getDepartment() {
    return this.department;
  }

  String getSex() {
    return this.sex;
  }

  String getCity() {
    return this.city;
  }

  List<String> getLanguages() {
    return this.languages;
  }

  List<String> getPersonalties() {
    return this.personalties;
  }

  List<String> getInterests() {
    return this.interests;
  }

  void clear() {
    college = '';
    department = '';
    sex = '';
    city = '';
    languages = [];
    personalties = [];
    interests = [];
  }
}
