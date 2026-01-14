import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_page.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  late Future<Pasien> futurePasien;

  @override
  void initState() {
    super.initState();
    futurePasien = PasienService().getById(widget.pasien.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pasien"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<Pasien>(
        future: futurePasien,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Data Tidak Ditemukan"));
          }

          final pasien = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nomor RM : ${pasien.nomorRm}"),
                const SizedBox(height: 8),
                Text("Nama : ${pasien.nama}"),
                const SizedBox(height: 8),
                Text("Tanggal Lahir : ${pasien.tanggalLahir}"),
                const SizedBox(height: 8),
                Text("No Telepon : ${pasien.nomorTelepon}"),
                const SizedBox(height: 8),
                Text("Alamat : ${pasien.alamat}"),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [_tombolUbah(pasien), _tombolHapus(pasien)],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _tombolUbah(Pasien pasien) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PasienUpdateForm(pasien: pasien)),
        ).then((_) {
          setState(() {
            futurePasien = PasienService().getById(widget.pasien.id.toString());
          });
        });
      },
      child: const Text("Ubah"),
    );
  }

  Widget _tombolHapus(Pasien pasien) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () async {
        await PasienService().hapus(pasien.id.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PasienPage()),
        );
      },
      child: const Text("Hapus"),
    );
  }
}
