import 'package:flutter/material.dart';
import '../model/dokter.dart';

class DokterForm extends StatefulWidget {
  const DokterForm({super.key});

  @override
  State<DokterForm> createState() => _DokterFormState();
}

class _DokterFormState extends State<DokterForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _spesialisCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Dokter"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNama(),
              _fieldNIP(),
              _fieldSpesialis(),
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
        decoration: const InputDecoration(labelText: "Nama Dokter"),
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

  Padding _fieldSpesialis() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: "Spesialis"),
        controller: _spesialisCtrl,
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
            _spesialisCtrl.text.isNotEmpty &&
            _telpCtrl.text.isNotEmpty) {
          final dokter = Dokter(
            nama: _namaCtrl.text,
            nip: _nipCtrl.text,
            spesialis: _spesialisCtrl.text,
            nomorTelepon: _telpCtrl.text,
          );
          Navigator.pop(context, dokter);
        }
      },
      child: const Text("Simpan"),
    );
  }
}
