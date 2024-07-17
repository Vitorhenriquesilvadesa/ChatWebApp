import 'package:chat_web_app/constants/app_color.dart';
import 'package:chat_web_app/constants/size.dart';
import 'package:chat_web_app/pages/home/register_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > kDesktopMediumWidth) {
          return Stack(
            children: [
              SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image.asset(
                    fit: BoxFit.cover, "assets/images/welcome_background.jpg"),
              ),
              Row(
                children: [
                  const Spacer(flex: 3),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topLeft,
                      color: mainDarkColor1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 100),
                      child: PageView.builder(
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const RegisterMenu());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  color: mainDarkColor1,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 100),
                  child: PageView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const RegisterMenu();
                    },
                  ),
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
