import 'package:app_news/src/pages/tabs_page.dart';
import 'package:app_news/src/theme/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novo App',
      theme: miTema,
      home: TabsPage(),
    );
  }
}
