import 'package:ecommerce_training/main.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HomeScreen',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
