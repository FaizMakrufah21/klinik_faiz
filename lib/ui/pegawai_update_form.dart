import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _namaCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaCtrl.text = widget.pegawai.nama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: Column(
        children: [
          TextField(
            controller: _namaCtrl,
            decoration: const InputDecoration(labelText: "Nama Pegawai"),
          ),
          ElevatedButton(
            onPressed: () async {
              Pegawai pegawai = Pegawai(
                nip: widget.pegawai.nip,
                nama: _namaCtrl.text,
                tanggalLahir: widget.pegawai.tanggalLahir,
                nomorTelepon: widget.pegawai.nomorTelepon,
                email: widget.pegawai.email,
                password: widget.pegawai.password,
              );

              await PegawaiService()
                  .ubah(pegawai, widget.pegawai.id.toString())
                  .then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PegawaiDetail(pegawai: value),
                      ),
                    );
                  });
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
