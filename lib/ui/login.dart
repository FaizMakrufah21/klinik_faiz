import 'package:flutter/material.dart';
import 'package:my_app/service/login_service.dart';
import 'beranda.dart'; // ✅ pastikan file ini ada di folder ui

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Admin",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                      children: [
                        _usernameTextField(),
                        const SizedBox(height: 20),
                        _passwordTextField(),
                        const SizedBox(height: 40),
                        _tombolLogin(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Username",
        border: OutlineInputBorder(),
      ),
      controller: _usernameCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Username tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      controller: _passwordCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget _tombolLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: const Text("Login"),
        onPressed: () async {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;

          await LoginService().login(username, password).then((value) {
            if (value == true) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text("Username atau Password Tidak Valid"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              );

              showDialog(context: context, builder: (context) => alertDialog);
            }
          });
        },
      ),
    );
  }

  //   Widget _tombolLogin(BuildContext context) {
  //     return SizedBox(
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.red,
  //           padding: const EdgeInsets.symmetric(vertical: 14),
  //         ),
  //         onPressed: () {
  //           if (_formKey.currentState!.validate()) {
  //             // ✅ Contoh login sederhana
  //             if (_usernameCtrl.text == "admin" &&
  //                 _passwordCtrl.text == "12345") {
  //               // pindah ke halaman Beranda
  //               Navigator.pushReplacement(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => const Beranda()),
  //               );
  //             } else {
  //               // tampilkan pesan error
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 const SnackBar(
  //                   content: Text("Username atau Password salah!"),
  //                   backgroundColor: Colors.red,
  //                 ),
  //               );
  //             }
  //           }
  //         },
  //         child: const Text(
  //           "Login",
  //           style: TextStyle(fontSize: 18, color: Colors.white),
  //         ),
  //       ),
  //     );
  //   }
  // }
}
