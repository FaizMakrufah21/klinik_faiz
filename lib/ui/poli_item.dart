import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;
  final VoidCallback? onTap;

  const PoliItem({super.key, required this.poli, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
    );
  }
}
