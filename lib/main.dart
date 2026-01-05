import 'package:flutter/material.dart';
import '/helpers/user_info.dart';
import '/ui/beranda.dart';
import '/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == null ? Login() : Beranda(),
    ),
  );
}


// import 'package:flutter/material.dart';
// import '/ui/login.dart'; // pastikan path sesuai dengan struktur project kamu

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Klinik App',
//       theme: ThemeData(
//         fontFamily: 'Tahoma', // 🔥 Semua teks pakai Tahoma
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
//         useMaterial3: true, // opsional (biar tampilan lebih modern)
//       ),
//       home: const Login(),
//     );
//   }
// }
