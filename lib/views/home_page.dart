import 'package:flutter/material.dart';
import '../components/drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/views/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Yönetimi'),
      ),
      drawer: DrawerMenu(),
      body: Container(),
    );
  }
}
