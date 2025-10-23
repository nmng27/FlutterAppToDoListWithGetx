import 'package:get/get.dart';
import 'package:to_do_list_app/data/mock/user_mock.dart';
import 'package:to_do_list_app/data/model/user.dart';

class UserController extends GetxController{
  final list = <User>[].obs;
  User? user;
  bool? isLogged;

  @override
  void onInit() {
    super.onInit();
    usersMock.map((e){
      list.assign(
        User.fromJson(e)
      );
    });
  }

  Future<void> login({
    required String email,
    required String password
  }) async{
    try{
      var data = list.where((e)=>e.email == email && e.password == password).firstOrNull;
      user = data;
      isLogged = true;
    }catch(e){
      print(e);
    }
  }

  Future<void> logout() async{
    try{
      isLogged = false;
    }catch(e){
      print(e);
    }
  }
  
  Future<User?> getData() async{
    try{
      return user;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<void> register({
    required String cpf,
    required String name, 
    required String email,
     required String phone,
     required String position,
     required String password
  }) async{
    try{
      list.add(
      User(
        id: list.last.id+1, 
        cpf: cpf, 
        name: name, 
        email: email, 
        phone: phone, 
        currentPosition: position, 
        password: password)
    );
    }catch(e){
      print(e);
    }
  }

  Future<void> updateUser({
    required int id,
    required String email,
    required String phone,
    required String position,
    required String password
  }) async{
    try{
      final index = list.indexWhere((e)=>e.id == id);
      final search = User(
        id: id, 
        cpf: list.where((e)=>e.id == id).single.cpf, 
        name: list.where((e)=>e.id == id).single.name, 
        email: email, 
        phone: phone, 
        currentPosition: position, 
        password: password);
      list[index] = search;
    }catch(e){
      print(e);
    }
  }

  Future<void> deleteUser({
    required int id
  }) async{
    try{
      list.removeWhere((e)=>e.id == id);
    }catch(e){
      print(e);
    }
  }
}