import 'package:chat_web_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class ChatWebApp extends StatefulWidget {
  const ChatWebApp({super.key});

  @override
  State<ChatWebApp> createState() => _ChatWebAppState();
}

class _ChatWebAppState extends State<ChatWebApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
