import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_item.dart';
import 'poli_form.dart';
import 'poli_detail.dart';
import '../widget/sidebar.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});
  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  // Daftar awal data poli
  List<Poli> poliList = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kaungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
    Poli(namaPoli: "Poli jantung  "),
    Poli(namaPoli: "Poli bandeng"),
    Poli(namaPoli: "Poli mata"),
  ];
  // Tambah data poli
  void _tambahPoli(Poli poli) {
    setState(() {
      poliList.add(poli);
    });
  }

  // Ubah data poli
  void _ubahPoli(int index, Poli poliBaru) {
    setState(() {
      poliList[index] = poliBaru;
    });
  }

  // Hapus data poli
  void _hapusPoli(int index) {
    setState(() {
      poliList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli Faiz Makrufah [02]"),
        backgroundColor: Colors.green, // 🔴 AppBar merah
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(Icons.add),
            ),
            onTap: () async {
              final Poli? newPoli = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
              if (newPoli != null) {
                _tambahPoli(newPoli);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: poliList.length,
        itemBuilder: (context, index) {
          final poli = poliList[index];
          return PoliItem(
            poli: poli,
            onTap: () async {
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(
                    poli: poli,
                    index: index,
                  ),
                ),
              );

              if (hasil is Poli) {
                _ubahPoli(index, hasil);
              } else if (hasil == 'hapus') {
                _hapusPoli(index);
              }
            },
          );
        },
      ),
    );
  }
}
