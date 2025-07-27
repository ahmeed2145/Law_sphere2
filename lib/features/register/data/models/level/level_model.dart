class LevelModel {
  final int level;
  final String name;

  LevelModel({required this.level, required this.name});

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      level: _mapLevelNameToInt(json['name']),
      name: json['name'],
    );
  }

  static int _mapLevelNameToInt(String name) {
    switch (name.trim()) {
      case 'المستوى الأول':
        return 1;
      case 'المستوى الثاني':
        return 2;
      case 'المستوى الثالث':
        return 3;
      case 'المستوى الرابع':
        return 4;
      default:
        return 0;
    }
  }
}
