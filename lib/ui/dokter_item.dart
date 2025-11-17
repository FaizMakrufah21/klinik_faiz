import 'package:flutter/material.dart';
import '../model/dokter.dart';

class DokterItem extends StatelessWidget {
  final Dokter dokter;
  final VoidCallback? onTap;

  const DokterItem({super.key, required this.dokter, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          title: Text(dokter.nama),
          subtitle: Text("NIP: ${dokter.nip}"),
        ),
      ),
    );
  }
}
