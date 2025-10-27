import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Beranda"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          "SELAMAT DATANG DI KLINIK Dr.Faiz Makrufah [02]",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
