class QuizModel{
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final CategoryModel? category;

  QuizModel(this.id, this.name, this.description, this.imageUrl, this.category);

  factory QuizModel.fromJson(Map<String, dynamic> json){
    return QuizModel(
      json["id"], 
      json["name"], 
      json["description"], 
      json["imageUrl"], 
      json["category"] != null ? CategoryModel.fromJson(json["category"]): null
    );
  }
}


class CategoryModel{
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  CategoryModel(this.id, this.name, this.description, this.imageUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      json["id"], 
      json["name"], 
      json["description"], 
      json["imageUrl"]
    );
  }
}