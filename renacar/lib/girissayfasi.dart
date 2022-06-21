import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renacar/anasayfa.dart';
import 'package:renacar/kay%C4%B1tolsayfasi.dart';

class girissayfasi extends StatefulWidget {
  const girissayfasi({Key? key}) : super(key: key);

  @override
  State<girissayfasi> createState() => _girissayfasiState();
}

class _girissayfasiState extends State<girissayfasi> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final epostacontroller = TextEditingController();
    final sifrecontroller = TextEditingController();

    final _firebaseAuth = FirebaseAuth.instance;

    Future<User?> girisyap(String eposta, String sifre) async {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: eposta, password: sifre);
      return userCredentials.user;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 236, 237),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {},
                      child: Text(
                        "Admin Girişi",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    "IsoCar",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: Text(
                  "Giriş Yap",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 45, left: 45, top: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: epostacontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Bu alan Boş Bırakılamaz";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "E-posta adresinizi giriniz",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: sifrecontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Bu alan Boş Bırakılamaz";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Şifrenizi giriniz",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              final user = await girisyap(
                                  epostacontroller.text, sifrecontroller.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => anasayfa(),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 25, right: 25),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => kayitolsayfasi()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: Text(
                              "Kayıt Ol",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
