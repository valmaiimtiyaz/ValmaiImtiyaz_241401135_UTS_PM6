import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skor Akhir')),
      body: const Center(child: Text('Ini adalah Halaman Hasil')),
    );
  }
}
