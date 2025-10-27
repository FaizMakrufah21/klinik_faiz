import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_update_form.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  final int index;

  const PoliDetail({super.key, required this.poli, required this.index});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Poli"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text("Nama Poli : ${widget.poli.namaPoli}",
              style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final Poli? hasilUbah = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoliUpdateForm(poli: widget.poli),
                    ),
                  );
                  if (hasilUbah != null) {
                    Navigator.pop(context, hasilUbah);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Ubah"),
              ),
              ElevatedButton(
                onPressed: () {
                  // 🔹 konfirmasi hapus
                  AlertDialog alertDialog = AlertDialog(
                    content: const Text("Yakin ingin menghapus data ini?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // tutup dialog
                          Navigator.pop(
                              context, 'hapus'); // kirim ke page utama
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("YA"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text("Tidak"),
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (context) => alertDialog,
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red), // ganti warna tombol
                child: const Text("Hapus"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
