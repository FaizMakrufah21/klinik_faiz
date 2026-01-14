import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_form.dart';
import 'pegawai_detail.dart';
import 'pegawai_item.dart';
import '../widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  Stream<List<Pegawai>> getList() async* {
    List<Pegawai> data = await PegawaiService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PegawaiForm()),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Pegawai>>(
        stream: getList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data Pegawai Kosong"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final pegawai = snapshot.data![index];
              return PegawaiItem(
                pegawai: pegawai,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PegawaiDetail(pegawai: pegawai),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../model/pegawai.dart';
// import '../widget/sidebar.dart';
// import 'pegawai_form.dart';
// import 'pegawai_detail.dart';
// import 'pegawai_item.dart';

// class PegawaiPage extends StatefulWidget {
//   const PegawaiPage({super.key});

//   @override
//   State<PegawaiPage> createState() => _PegawaiPageState();
// }

// class _PegawaiPageState extends State<PegawaiPage> {
//   List<Pegawai> pegawaiList = [
//     Pegawai(nama: "Faiz Makrufah", nip: "001", tanggalLahir: "21-07-204", nomorTelepon: "082108051754"),
//     Pegawai(nama: "Siti Aminah", nip: "002", tanggalLahir: "10-05-2003", nomorTelepon: "0812765432"),
//   ];

//   void _tambahPegawai(Pegawai pegawai) {
//     setState(() => pegawaiList.add(pegawai));
//   }

//   void _ubahPegawai(int index, Pegawai pegawaiBaru) {
//     setState(() => pegawaiList[index] = pegawaiBaru);
//   }

//   void _hapusPegawai(int index) {
//     setState(() => pegawaiList.removeAt(index));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const Sidebar(),
//       appBar: AppBar(
//         title: const Text("Data Pegawai Faiz Makrufah [02]"),
//         backgroundColor: Colors.green,
//         actions: [
//           GestureDetector(
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Icon(Icons.add),
//             ),
//             onTap: () async {
//               final Pegawai? result = await Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const PegawaiForm()),
//               );
//               if (result != null) _tambahPegawai(result);
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: pegawaiList.length,
//         itemBuilder: (context, index) {
//           final pegawai = pegawaiList[index];
//           return PegawaiItem(
//             pegawai: pegawai,
//             onTap: () async {
//               final hasil = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PegawaiDetail(pegawai: pegawai, index: index),
//                 ),
//               );

//               if (hasil is Pegawai) {
//                 _ubahPegawai(index, hasil);
//               } else if (hasil == 'hapus') {
//                 _hapusPegawai(index);
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
