import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../service/poli_service.dart';
import 'poli_item.dart';
import 'poli_form.dart';
import 'poli_detail.dart';
import '../widget/sidebar.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli Faiz Makrufah [02]"),
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(Icons.add),
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Poli>>(
        stream: getList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data Poli Kosong"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final poli = snapshot.data![index];
              return PoliItem(
                poli: poli,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoliDetail(poli: poli),
                    ),
                  ).then((_) {
                    setState(() {});
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

// import 'package:flutter/material.dart';
// import '../model/poli.dart';
// import '../service/poli_service.dart';
// import 'poli_item.dart';
// import 'poli_form.dart';
// import 'poli_detail.dart';
// import '../widget/sidebar.dart';

// class PoliPage extends StatefulWidget {
//   const PoliPage({super.key});

//   @override
//   State<PoliPage> createState() => _PoliPageState();
// }

// class _PoliPageState extends State<PoliPage> {
//   Stream<List<Poli>> getList() async* {
//     List<Poli> data = await PoliService().listData();
//     yield data;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const Sidebar(),
//       appBar: AppBar(
//         title: const Text("Data Poli Faiz Makrufah [02]"),
//         backgroundColor: Colors.green,
//         actions: [
//           GestureDetector(
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12.0),
//               child: Icon(Icons.add),
//             ),
//             onTap: () async {
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const PoliForm()),
//               );
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<Poli>>(
//         stream: getList(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }

//           if (snapshot.connectionState != ConnectionState.done) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("Data Poli Kosong"));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final poli = snapshot.data![index];
//               return PoliItem(
//                 poli: poli,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PoliDetail(poli: poli, index: index),
//                     ),
//                   ).then((_) {
//                     setState(() {});
//                   });
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
