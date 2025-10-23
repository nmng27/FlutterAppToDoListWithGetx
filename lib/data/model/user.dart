class User {
  final int id;
  final String cpf;
  final String name;
  final String email;
  final String phone;
  final String currentPosition;
  final String password;

  const User({
    required this.id,
    required this.cpf,
    required this.name,
    required this.email,
    required this.phone,
    required this.currentPosition,
    required this.password
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"], 
      cpf: json["cpf"], 
      name: json["name"], 
      email: json["email"], 
      phone: json["phone"], 
      currentPosition: json["current_position"], 
      password: json["password"]);
  }
}