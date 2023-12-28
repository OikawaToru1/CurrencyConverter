// ignore: file_names
import 'package:flutter/material.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
      useMaterial3: true,
      
      ),
    
      home: const HomePage(),
      
    );
  }
}
