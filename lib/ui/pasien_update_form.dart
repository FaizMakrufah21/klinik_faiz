import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomorRmCtrl.text = widget.pasien.nomorRm;
    _namaCtrl.text = widget.pasien.nama;
    _tanggalLahirCtrl.text = widget.pasien.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pasien.nomorTelepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
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
                  id: widget.pasien.id,
                  nomorRm: _nomorRmCtrl.text,
                  nama: _namaCtrl.text,
                  tanggalLahir: _tanggalLahirCtrl.text,
                  nomorTelepon: _nomorTeleponCtrl.text,
                  alamat: _alamatCtrl.text,
                );

                await PasienService()
                    .ubah(pasien, widget.pasien.id.toString())
                    .then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PasienDetail(pasien: value),
                        ),
                      );
                    });
              },
              child: const Text("Simpan Perubahan"),
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
