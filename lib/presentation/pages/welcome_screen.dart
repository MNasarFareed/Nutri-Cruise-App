import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Hello")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("data")],
      ),
    );
  }
}
