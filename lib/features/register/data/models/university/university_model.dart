class UniversityModel {
  final String id;

  final String name;

  UniversityModel({required this.id, required this.name});
  factory UniversityModel.fromJson(Map<String , dynamic>json){
       return UniversityModel(
      id: json['id'],
      name: json['name'],
    ); 
  }
}