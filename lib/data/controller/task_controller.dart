import 'package:get/get.dart';
import 'package:to_do_list_app/data/mock/task_mock.dart';
import 'package:to_do_list_app/data/model/task.dart';

class TaskController extends GetxController{
  var list = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    taskMock.map((e){
      list.assign(
        Task.fromJson(e)
      );
    });
  }

  Future<void> createTask(
    {
      required int userId,
      required String name, 
      required String category,
      required DateTime date
    }
  ) async{
    try{
      list.add(
      Task(
        id: list.last.id+1, 
        userId: userId, 
        name: name, 
        category: category, 
        dateCreated: DateTime.now(), 
        endExpectDate: date, 
        isFinish: false)
    );
    }catch(e){
      print(e);
    }
  }

  Future<void> updateTask({
    required int id,
    required String name, 
    required String category,
    required DateTime date
  }) async{
    try{
      final task = Task(
        id: id, 
        userId: list.where((e)=>e.id == id).single.userId, 
        name: name, 
        category: category, 
        dateCreated: list.where((e)=>e.id == id).single.dateCreated, 
        endExpectDate: date, 
        isFinish: list.where((e)=>e.id == id).single.isFinish);
      final index = list.indexWhere((e)=>e.id == id);
        list[index] = task;
    }catch(e){
      print(e);
    }
  }

  Future<void> done(
    {required int id}
  ) async{
    try{
      final index = list.indexWhere((e)=>e.id == id);
      final item = list.where((e)=>e.id == id).single;
      list[index] = Task(
        id: id, 
        userId: item.userId, 
        name: item.name, 
        category: item.category, 
        dateCreated: item.dateCreated, 
        endExpectDate: item.endExpectDate, 
        isFinish: true);
    }catch(e){
      print(e);
    }
  }

  Future<void> deleteTask({
    required int id
  }) async{
    try{
      list.removeWhere((e)=>e.id == id);
    }catch(e){
      print(e);
    }
  }

  Task? getTaskById(
    {required int id}
  ) {
    try{
      var task = list.where((e)=>e.id == id).firstOrNull;
      return task;
    }catch(e){
      print(e);
      return null;
    }
  }

  void onFilter({
  required String? name,
}) {
  try {
    final result = list.where((e) {
      final matchName = name == null || name.isEmpty
          ? true
          : e.name.toLowerCase().contains(name.toLowerCase().trim());
      return matchName;
    }).toList();

    list.assignAll(result);
  } catch (e) {
    print('Erro ao filtrar: $e');
  }
}

}