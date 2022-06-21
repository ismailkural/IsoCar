import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renacar/anasayfa.dart';

class arabadetaylarsayfasi extends StatefulWidget {
  String model, yil, resim, hiz, vites, yakit, kasa, logo, ucret, docid;
  arabadetaylarsayfasi(this.hiz, this.kasa, this.logo, this.model, this.resim,
      this.ucret, this.vites, this.yakit, this.yil, this.docid);

  @override
  State<arabadetaylarsayfasi> createState() => _arabadetaylarsayfasiState();
}

final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
CollectionReference arabaref = db.collection("Arabalar");
CollectionReference usersRef = db.collection("Users");

class _arabadetaylarsayfasiState extends State<arabadetaylarsayfasi> {
  @override
  Widget build(BuildContext context) {
    IconData icongaz = Icons.local_gas_station;
    IconData iconspeed = Icons.speed;
    IconData iconvites = Icons.settings;
    IconData iconkasa = Icons.directions_car;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 236, 237),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0070708),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 25),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.asset(
                              widget.logo,
                              width: 65,
                              height: 65,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.yil,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Image.network(
                      widget.resim,
                      width: 350,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Row(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 170,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Color(0xff0070708),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          iconspeed,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.hiz,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "km/h",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 170,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Color(0xff0070708),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          iconvites,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.vites,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text(
                              "vites",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 170,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Color(0xff0070708),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          iconkasa,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.kasa,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text(
                              "Kasa",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 170,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Color(0xff0070708),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          icongaz,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.yakit,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            widget.ucret,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          Text(
                            "TL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          Text(
                            "/day",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 46,
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        _showMyDialog();
                      },
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 41, 141, 223),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, bottom: 30, left: 70, right: 70),
                            child: Text(
                              "Kirala",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kiralama İşleminiz Alındı'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Ekibimiz sizi arayıp detaylı bilgi vereceklerdir.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await arabalarRef.doc(widget.docid).update({"durum": false});
                var user = auth.currentUser!.uid;
                await usersRef.doc(user).collection("Kiralamalar").doc().set({
                  "aracid": widget.docid,
                  "model": widget.model,
                  "yil": widget.yil,
                  "resim": widget.resim,
                  "ucret": widget.ucret
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => anasayfa(),
                  ),
                );
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}
