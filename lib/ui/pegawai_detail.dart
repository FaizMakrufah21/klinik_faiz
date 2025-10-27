import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  final int index;

  const PegawaiDetail({super.key, required this.pegawai, required this.index});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pegawai"),
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
                Text("Nama: ${widget.pegawai.nama}", style: const TextStyle(fontSize: 18)),
                Text("NIP: ${widget.pegawai.nip}", style: const TextStyle(fontSize: 18)),
                Text("Tanggal Lahir: ${widget.pegawai.tanggalLahir}", style: const TextStyle(fontSize: 18)),
                Text("Nomor Telepon: ${widget.pegawai.nomorTelepon}", style: const TextStyle(fontSize: 18)),
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
                      builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai),
                    ),
                  );
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
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, 'hapus');
                        },
                        child: const Text("YA"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tidak"),
                      ),
                    ],
                  );
                  showDialog(context: context, builder: (context) => alertDialog);
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
