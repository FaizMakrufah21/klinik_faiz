import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_page.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({Key? key, required this.pegawai}) : super(key: key);

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  Stream<Pegawai> getData() async* {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              const SizedBox(height: 20),
              Text("NIP : ${snapshot.data.nip}"),
              Text("Nama : ${snapshot.data.nama}"),
              Text("Tanggal Lahir : ${snapshot.data.tanggalLahir}"),
              Text("No Telp : ${snapshot.data.nomorTelepon}"),
              Text("Email : ${snapshot.data.email}"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              ),
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PegawaiUpdateForm(pegawai: snapshot.data),
            ),
          );
        },
        child: const Text("Ubah"),
      ),
    );
  }

  _tombolHapus() {
    return ElevatedButton(
      onPressed: () async {
        await PegawaiService().hapus(widget.pegawai);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PegawaiPage()),
        );
      },
      child: const Text("Hapus"),
    );
  }
}
