import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  final VoidCallback? onTap;

  const PasienItem({super.key, required this.pasien, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          title: Text(pasien.nama),
          subtitle: Text("Nomor RM: ${pasien.nomorRm}"),
        ),
      ),
    );
  }
}
