import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';
import 'package:mirai_json_parser/pages/editor.dart';

void main() async{
  await Mirai.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirai Json Parser',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
        useMaterial3: true,
      ),
      home: const Editor(),
    );
  }
}
