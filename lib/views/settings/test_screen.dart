import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AppNavigator.appNavigator(context, HomeScreen(),
                  isFinished: true);
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
