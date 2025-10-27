import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../widget/sidebar.dart';
import 'pasien_item.dart';
import 'pasien_form.dart';
import 'pasien_detail.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> pasienList = [
    Pasien(nama: "m. Hasan", nik: "3271011001010001", alamat: "Jl. Merdeka No.10", nomorTelepon: "0812345678"),
    Pasien(nama: "Suci Permata", nik: "3271012002020002", alamat: "Jl. Melati No.5", nomorTelepon: "0898765432"),
  ];

  void _tambahPasien(Pasien pasien) {
    setState(() => pasienList.add(pasien));
  }

  void _ubahPasien(int index, Pasien pasienBaru) {
    setState(() => pasienList[index] = pasienBaru);
  }

  void _hapusPasien(int index) {
    setState(() => pasienList.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien Faiz Makrufah [02]"),
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.add),
            ),
            onTap: () async {
              final Pasien? result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienForm()),
              );
              if (result != null) _tambahPasien(result);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pasienList.length,
        itemBuilder: (context, index) {
          final pasien = pasienList[index];
          return PasienItem(
            pasien: pasien,
            onTap: () async {
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien, index: index),
                ),
              );

              if (hasil is Pasien) {
                _ubahPasien(index, hasil);
              } else if (hasil == 'hapus') {
                _hapusPasien(index);
              }
            },
          );
        },
      ),
    );
  }
}
