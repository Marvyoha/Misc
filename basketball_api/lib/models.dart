class TeamsData {
  final String abb;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;

  TeamsData(
      {required this.abb,
      required this.city,
      required this.conference,
      required this.division,
      required this.fullName,
      required this.name});

  factory TeamsData.fromJson(Map<String, dynamic> json) {
    return TeamsData(
        abb: json['abbreviation'],
        city: json['city'],
        conference: json['conference'],
        division: json['division'],
        fullName: json['full_name'],
        name: json['name']);
  }
}
