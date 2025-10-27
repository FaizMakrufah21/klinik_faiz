import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  final int index;

  const PasienDetail({super.key, required this.pasien, required this.index});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pasien"),
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
                Text("Nama: ${widget.pasien.nama}", style: const TextStyle(fontSize: 18)),
                Text("NIK: ${widget.pasien.nik}", style: const TextStyle(fontSize: 18)),
                Text("Alamat: ${widget.pasien.alamat}", style: const TextStyle(fontSize: 18)),
                Text("Nomor Telepon: ${widget.pasien.nomorTelepon}", style: const TextStyle(fontSize: 18)),
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
                      builder: (context) => PasienUpdateForm(pasien: widget.pasien),
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
