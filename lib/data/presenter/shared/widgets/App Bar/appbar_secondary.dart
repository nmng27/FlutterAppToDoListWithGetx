import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarSecondary extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const AppbarSecondary({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 98, 8, 2),
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
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

