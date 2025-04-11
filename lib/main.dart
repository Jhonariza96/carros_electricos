import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const CarrosApp());
}

class CarrosApp extends StatelessWidget {
  const CarrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carros Eléctricos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
