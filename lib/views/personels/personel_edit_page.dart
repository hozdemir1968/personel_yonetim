import 'package:flutter/material.dart';

class PersonelEditPage extends StatefulWidget {
  const PersonelEditPage({super.key});
  static const String routeName = '/views/personels/personelEdit';

  @override
  State<PersonelEditPage> createState() => _PersonelEditPageState();
}

class _PersonelEditPageState extends State<PersonelEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personel Bilgi Güncelle')),
      body: Container(),
    );
  }
}
