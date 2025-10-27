import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nikCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaCtrl.text = widget.pasien.nama;
    _nikCtrl.text = widget.pasien.nik;
    _alamatCtrl.text = widget.pasien.alamat;
    _telpCtrl.text = widget.pasien.nomorTelepon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Data Pasien"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNama(),
              _fieldNIK(),
              _fieldAlamat(),
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
        decoration: const InputDecoration(labelText: "Nama Pasien"),
        controller: _namaCtrl,
      ),
    );
  }

  Padding _fieldNIK() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "NIK"),
        controller: _nikCtrl,
      ),
    );
  }

  Padding _fieldAlamat() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "Alamat"),
        controller: _alamatCtrl,
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
        final pasienBaru = Pasien(
          nama: _namaCtrl.text,
          nik: _nikCtrl.text,
          alamat: _alamatCtrl.text,
          nomorTelepon: _telpCtrl.text,
        );
        Navigator.pop(context, pasienBaru);
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
