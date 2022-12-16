import 'package:flutter/material.dart';
import 'package:shopping_list/home_page.dart';
import 'package:shopping_list/inherited_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: ItemCartInhertied(child: const HomePage())),
    );
  }
}
