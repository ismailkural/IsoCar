import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renacar/anasayfa.dart';
import 'package:renacar/girissayfasi.dart';

class kayitolsayfasi extends StatefulWidget {
  const kayitolsayfasi({Key? key}) : super(key: key);

  @override
  State<kayitolsayfasi> createState() => _kayitolsayfasiState();
}

class _kayitolsayfasiState extends State<kayitolsayfasi> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final epostacontroller = TextEditingController();
    final sifrecontroller = TextEditingController();
    final telcontroller = TextEditingController();
    final adcontroller = TextEditingController();
    final soyadcontroller = TextEditingController();
    final _firebaseAuth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    final CollectionReference userRef = db.collection("Users");

    Future<User?> kayitol(String eposta, String sifre) async {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: eposta, password: sifre);
      return userCredentials.user;
    }

    Future<void> kullaniciolustur(
        String uid, String adi, String soyad, String tel) async {
      return await userRef.doc(uid).set({
        "adi": adi,
        "soyadi": soyad,
        "tel": tel,
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 236, 237),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 30),
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
                padding: const EdgeInsets.only(top: 10),
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
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                    child: Text(
                  "Kayıt Ol",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 45, left: 45, top: 15),
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
                        controller: adcontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Bu alan Boş Bırakılamaz";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Adınızı giriniz",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: soyadcontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Bu alan Boş Bırakılamaz";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Soyadınızı giriniz",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: telcontroller,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Bu alan Boş Bırakılamaz";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Telefon numaranızı giriniz",
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
                              final user = await kayitol(
                                  epostacontroller.text, sifrecontroller.text);
                              var uid = await user!.uid;
                              await kullaniciolustur(uid, adcontroller.text,
                                  soyadcontroller.text, telcontroller.text);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => girissayfasi(),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 25, right: 25),
                            child: Text(
                              "Kayıt Ol",
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
                                    builder: (context) => girissayfasi()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: Text(
                              "Giriş Yap",
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
