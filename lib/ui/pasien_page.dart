import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_form.dart';
import 'pasien_detail.dart';
import 'pasien_item.dart';
import '../widget/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  late Future<List<Pasien>> futurePasien;

  @override
  void initState() {
    super.initState();
    futurePasien = PasienService().listData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PasienForm()),
              );
              setState(() {
                futurePasien = PasienService().listData();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Pasien>>(
        future: futurePasien,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data Pasien Kosong"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final pasien = snapshot.data![index];
              return PasienItem(
                pasien: pasien,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PasienDetail(pasien: pasien),
                    ),
                  ).then((_) {
                    setState(() {
                      futurePasien = PasienService().listData();
                    });
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
