import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _tglCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNama(),
              _fieldNIP(),
              _fieldTanggalLahir(),
              _fieldTelepon(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _fieldNama() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "Nama Pegawai"),
        controller: _namaCtrl,
      ),
    );
  }

  Padding _fieldNIP() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "NIP"),
        controller: _nipCtrl,
      ),
    );
  }

  Padding _fieldTanggalLahir() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "Tanggal Lahir"),
        controller: _tglCtrl,
      ),
    );
  }

  Padding _fieldTelepon() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "Nomor Telepon"),
        controller: _telpCtrl,
      ),
    );
  }

  ElevatedButton _tombolSimpan() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        if (_namaCtrl.text.isNotEmpty &&
            _nipCtrl.text.isNotEmpty &&
            _tglCtrl.text.isNotEmpty &&
            _telpCtrl.text.isNotEmpty) {
          final pegawai = Pegawai(
            nama: _namaCtrl.text,
            nip: _nipCtrl.text,
            tanggalLahir: _tglCtrl.text,
            nomorTelepon: _telpCtrl.text,
          );
          Navigator.pop(context, pegawai);
        }
      },
      child: const Text("Simpan"),
    );
  }
}
