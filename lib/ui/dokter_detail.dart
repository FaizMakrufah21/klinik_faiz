import 'package:flutter/material.dart';
import '../model/dokter.dart';
import 'dokter_update_form.dart';

class DokterDetail extends StatefulWidget {
  final Dokter dokter;
  final int index;

  const DokterDetail({super.key, required this.dokter, required this.index});

  @override
  State<DokterDetail> createState() => _DokterDetailState();
}

class _DokterDetailState extends State<DokterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Dokter"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama: ${widget.dokter.nama}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "NIP: ${widget.dokter.nip}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Spesialis: ${widget.dokter.spesialis}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Nomor Telepon: ${widget.dokter.nomorTelepon}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () async {
                  final hasilUbah = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DokterUpdateForm(dokter: widget.dokter),
                    ),
                  );
                  // ignore: use_build_context_synchronously
                  if (hasilUbah != null) Navigator.pop(context, hasilUbah);
                },
                child: const Text("Ubah"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  AlertDialog alertDialog = AlertDialog(
                    content: const Text("Yakin ingin menghapus data ini?"),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, 'hapus');
                        },
                        child: const Text("YA"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tidak"),
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (context) => alertDialog,
                  );
                },
                child: const Text("Hapus"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
