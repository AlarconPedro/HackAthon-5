import 'package:flutter/material.dart';
import 'package:hackathon/ui/pages/home_page.dart';
import 'package:hackathon/ui/pages/login/login.dart';
import 'package:hackathon/ui/pages/pages.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Angler",
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            const LoginForm(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
