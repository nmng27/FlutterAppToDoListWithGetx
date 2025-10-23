import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/data/controller/user_controller.dart';

class AppbarPrimary extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const AppbarPrimary({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 98, 8, 2),
      actions: [
        IconButton(
          onPressed: (){
            controller.logout();
            Get.toNamed("/login");
          }, 
          icon: Icon(Icons.logout, color: Colors.white,)
        )
      ],
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

