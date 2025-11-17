import 'package:flutter/material.dart';
import '../model/dokter.dart';
import '../widget/sidebar.dart';
import 'dokter_item.dart';
import 'dokter_form.dart';
import 'dokter_detail.dart';

class DokterPage extends StatefulWidget {
  const DokterPage({super.key});

  @override
  State<DokterPage> createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  List<Dokter> dokterList = [
    Dokter(
      nama: "dr. Rina Kurnia",
      nip: "198501010001",
      spesialis: "Umum",
      nomorTelepon: "081234567890",
    ),
    Dokter(
      nama: "dr. Budi Santoso",
      nip: "198606020002",
      spesialis: "Gigi",
      nomorTelepon: "089876543210",
    ),
  ];

  void _tambahDokter(Dokter dokter) {
    setState(() => dokterList.add(dokter));
  }

  void _ubahDokter(int index, Dokter dokterBaru) {
    setState(() => dokterList[index] = dokterBaru);
  }

  void _hapusDokter(int index) {
    setState(() => dokterList.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Dokter Faiz Makrufah [02]"),
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.add),
            ),
            onTap: () async {
              final Dokter? result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DokterForm()),
              );
              if (result != null) _tambahDokter(result);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dokterList.length,
        itemBuilder: (context, index) {
          final dokter = dokterList[index];
          return DokterItem(
            dokter: dokter,
            onTap: () async {
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DokterDetail(dokter: dokter, index: index),
                ),
              );

              if (hasil is Dokter) {
                _ubahDokter(index, hasil);
              } else if (hasil == 'hapus') {
                _hapusDokter(index);
              }
            },
          );
        },
      ),
    );
  }
}
