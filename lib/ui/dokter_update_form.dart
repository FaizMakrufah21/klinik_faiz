import 'package:flutter/material.dart';
import '../model/dokter.dart';

class DokterUpdateForm extends StatefulWidget {
  final Dokter dokter;
  const DokterUpdateForm({super.key, required this.dokter});

  @override
  State<DokterUpdateForm> createState() => _DokterUpdateFormState();
}

class _DokterUpdateFormState extends State<DokterUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _spesialisCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaCtrl.text = widget.dokter.nama;
    _nipCtrl.text = widget.dokter.nip;
    _spesialisCtrl.text = widget.dokter.spesialis;
    _telpCtrl.text = widget.dokter.nomorTelepon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Data Dokter"),
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
        final dokterBaru = Dokter(
          nama: _namaCtrl.text,
          nip: _nipCtrl.text,
          spesialis: _spesialisCtrl.text,
          nomorTelepon: _telpCtrl.text,
        );
        Navigator.pop(context, dokterBaru);
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
