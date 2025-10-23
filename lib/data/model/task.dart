
class Task {
  final int id;
  final int userId;
  final String name;
  final String category;
  final DateTime dateCreated;
  final DateTime endExpectDate;
  final bool isFinish;

  const Task({
    required this.id,
    required this.userId,
    required this.name,
    required this.category,
    required this.dateCreated,
    required this.endExpectDate,
    required this.isFinish
  });

  factory Task.fromJson(Map<String, dynamic> json){
    return Task(
      id: json["id"], 
      userId: json["userId"], 
      name: json["name"], 
      category: json["category"], 
      dateCreated: json["dateCreated"], 
      endExpectDate: json["endExpectDate"], 
      isFinish: json["isFinish"]);
  }
}