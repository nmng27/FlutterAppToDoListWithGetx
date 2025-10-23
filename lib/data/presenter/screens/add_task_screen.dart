import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/data/controller/task_controller.dart';
import 'package:to_do_list_app/data/controller/user_controller.dart';
import 'package:to_do_list_app/data/presenter/shared/utils/text_formatter.dart';
import 'package:to_do_list_app/data/presenter/shared/widgets/App%20Bar/appbar_secondary.dart';
import 'package:to_do_list_app/data/presenter/shared/widgets/button/button.dart';
import 'package:to_do_list_app/data/presenter/shared/widgets/input/input_text_field.dart';

class AddTaskScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen>{
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final controller = Get.put(TaskController());
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSecondary(title: "Adicionar Tarefa"),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.6),
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: 16,),
                InputTextField(
                  label: "Tarefa", 
                  placeholder: "Digite o nome da tarefa.", 
                  controller: nameController, 
                  validator: (val){
                    if(val!.isEmpty){
                      return "Por favor digite o nome da tarefa.";
                    }
                    return null;
                  }, 
                  formatters: [OnlyLettersFormatter()], 
                  keyBoard: TextInputType.text, 
                  onChanged: (val){return null;}
                ),
                SizedBox(height: 16,),
                InputTextField(
                  label: "Categoria", 
                  placeholder: "Digite a categoria da tarefa.", 
                  controller: categoryController, 
                  validator: (val){
                    if(val!.isEmpty){
                      return "Por favor digite a categoria da tarefa.";
                    }
                    return null;
                  }, 
                  formatters: [OnlyLettersFormatter()], 
                  keyBoard: TextInputType.text, 
                  onChanged: (val){return null;}
                ),
                SizedBox(height: 16,),
                InputTextField(
                  label: "Data final", 
                  placeholder: "Digite a data final para conclusão da tarefa.", 
                  controller: dateController, 
                  validator: (val){
                    if(val!.isEmpty){
                      return "Por favor digite a data final de conclusão da tarefa.";
                    }
                    return null;
                  }, 
                  formatters: [OnlyLettersFormatter()], 
                  keyBoard: TextInputType.datetime, 
                  onChanged: (val){
                    return null;
                  }
                ),
              Button(label: "Salvar", onPressed: (){
                controller.createTask(
                  userId: userController.user!.id, 
                  name: nameController.text, 
                  category: categoryController.text, 
                  date: DateTime.parse(dateController.text));
              })

              ],
            ),
          ),
        ),
      ),
    );
  }
}