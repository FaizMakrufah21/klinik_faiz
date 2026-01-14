import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _field(_nomorRmCtrl, "Nomor RM"),
            _field(_namaCtrl, "Nama Pasien"),
            _field(_tanggalLahirCtrl, "Tanggal Lahir"),
            _field(_nomorTeleponCtrl, "Nomor Telepon"),
            _field(_alamatCtrl, "Alamat"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Pasien pasien = Pasien(
                  nomorRm: _nomorRmCtrl.text,
                  nama: _namaCtrl.text,
                  tanggalLahir: _tanggalLahirCtrl.text,
                  nomorTelepon: _nomorTeleponCtrl.text,
                  alamat: _alamatCtrl.text,
                );

                await PasienService().simpan(pasien).then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PasienDetail(pasien: value),
                    ),
                  );
                });
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
