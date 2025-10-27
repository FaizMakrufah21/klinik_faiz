import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _tglCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaCtrl.text = widget.pegawai.nama;
    _nipCtrl.text = widget.pegawai.nip;
    _tglCtrl.text = widget.pegawai.tanggalLahir;
    _telpCtrl.text = widget.pegawai.nomorTelepon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Data Pegawai"),
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
        final pegawaiBaru = Pegawai(
          nama: _namaCtrl.text,
          nip: _nipCtrl.text,
          tanggalLahir: _tglCtrl.text,
          nomorTelepon: _telpCtrl.text,
        );
        Navigator.pop(context, pegawaiBaru);
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
