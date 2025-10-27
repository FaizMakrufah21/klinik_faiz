import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  final VoidCallback? onTap;

  const PegawaiItem({super.key, required this.pegawai, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          title: Text(pegawai.nama),
          subtitle: Text("NIP: ${pegawai.nip}"),
        ),
      ),
    );
  }
}
