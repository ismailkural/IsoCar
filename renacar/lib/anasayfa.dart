import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renacar/arabadetaylarsayfasi.dart';
import 'package:renacar/girissayfasi.dart';
import 'package:renacar/kullanicisayfasi.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
CollectionReference arabalarRef = db.collection("Arabalar");
bool hepsimi = false;
bool bmwmi = false;
bool audimi = false;
bool fiatmi = false;
bool renaultmi = false;

class _anasayfaState extends State<anasayfa> {
  Color renk1 = Colors.white;
  Color renk2 = Colors.white;
  Color renk3 = Colors.white;
  Color renk4 = Colors.white;
  String iconbmw = "assets/bmwicon.png";
  String iconaudi = "assets/audiicon.png";
  String iconfiat = "assets/fiaticon.png";
  String iconrenault = "assets/renaulticon.png";

  @override
  Widget build(BuildContext context) {
    List<dynamic> arabalarList = [];
    var secilenaraba = arabalarRef
        .where("hepsi", isEqualTo: "hepsi")
        .where("durum", isEqualTo: true);
    if (hepsimi == true) {
      secilenaraba = arabalarRef
          .where("hepsi", isEqualTo: "hepsi")
          .where("durum", isEqualTo: true);
      arabalarList.clear();
      setState(() {});
    } else if (bmwmi == true) {
      secilenaraba = arabalarRef
          .where("marka", isEqualTo: "BMW")
          .where("durum", isEqualTo: true);
      arabalarList.clear();
      setState(() {});
    } else if (audimi == true) {
      secilenaraba = arabalarRef
          .where("marka", isEqualTo: "AUDI")
          .where("durum", isEqualTo: true);
      arabalarList.clear();
      setState(() {});
    } else if (fiatmi == true) {
      secilenaraba = arabalarRef
          .where("marka", isEqualTo: "FIAT")
          .where("durum", isEqualTo: true);
      arabalarList.clear();
      setState(() {});
    } else if (renaultmi == true) {
      secilenaraba = arabalarRef
          .where("marka", isEqualTo: "RENAULT")
          .where("durum", isEqualTo: true);
      arabalarList.clear();
      setState(() {});
    } else {
      var secilenaraba = arabalarRef
          .where("hepsi", isEqualTo: "hepsi")
          .where("durum", isEqualTo: true);
      arabalarList.clear();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 236, 237),
        body: FutureBuilder<QuerySnapshot>(
            future: secilenaraba.get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                arabalarList.clear();
                var querySnappshot = snapshot.data;
                var araba = querySnappshot!.docs;
                var mapdata = araba.forEach((doc) async {
                  var veri = doc.data() as Map<dynamic, dynamic>;

                  arabalarList.add(veri);
                });

                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            "Bir Araba Seçiniz",
                            style: TextStyle(
                                color: Color(0xff070708),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    final user = await auth.signOut();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                girissayfasi()));
                                  },
                                  child: Text("Çıkış Yap")),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                kullanicisayfasi()));
                                  },
                                  child: Text("İşlemlerim")),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 18),
                      child: Row(
                        children: [
                          Text(
                            "Markalar",
                            style: TextStyle(
                                color: Color(0xff070708),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  renk1 = Colors.white;
                                  renk2 = Colors.white;
                                  renk3 = Colors.white;
                                  renk4 = Colors.white;
                                  arabalarList.clear();
                                });
                                hepsimi = true;
                                bmwmi = false;
                                audimi = false;
                                fiatmi = false;
                                renaultmi = false;
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xff9FA0AB),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Text(
                                    "Hepsi",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  renk1 = Colors.blue;
                                  renk2 = Colors.white;
                                  renk3 = Colors.white;
                                  renk4 = Colors.white;
                                  arabalarList.clear();
                                });

                                hepsimi = false;
                                bmwmi = true;
                                audimi = false;
                                fiatmi = false;
                                renaultmi = false;
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: renk1,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    iconbmw,
                                    width: 65,
                                    height: 65,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  renk1 = Colors.white;
                                  renk2 = Colors.blue;
                                  renk3 = Colors.white;
                                  renk4 = Colors.white;
                                  arabalarList.clear();
                                });
                                hepsimi = false;
                                bmwmi = false;
                                audimi = true;
                                fiatmi = false;
                                renaultmi = false;
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: renk2,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    iconaudi,
                                    width: 65,
                                    height: 65,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  renk1 = Colors.white;
                                  renk2 = Colors.white;
                                  renk3 = Colors.blue;
                                  renk4 = Colors.white;
                                  arabalarList.clear();
                                });
                                hepsimi = false;
                                bmwmi = false;
                                audimi = false;
                                fiatmi = true;
                                renaultmi = false;
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: renk3,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    iconfiat,
                                    width: 65,
                                    height: 65,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  renk1 = Colors.white;
                                  renk2 = Colors.white;
                                  renk3 = Colors.white;
                                  renk4 = Colors.blue;
                                  arabalarList.clear();
                                });
                                setState(() {});
                                hepsimi = false;
                                bmwmi = false;
                                audimi = false;
                                fiatmi = false;
                                renaultmi = true;
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: renk4,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    iconrenault,
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Mevcut Arabalar",
                            style: TextStyle(
                                color: Color(0xff070708),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: arabalarList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 20, right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          arabalarList[index]["resim"],
                                          width: 230,
                                          height: 120,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              arabalarList[index]["model"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              arabalarList[index]["yil"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30,
                                      ),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                arabalarList[index]["ucret"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                "/day",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 68,
                                            height: 25,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              String model =
                                                  arabalarList[index]["model"];
                                              String yil =
                                                  arabalarList[index]["yil"];
                                              String resim =
                                                  arabalarList[index]["resim"];
                                              String hiz =
                                                  arabalarList[index]["hiz"];
                                              String vites =
                                                  arabalarList[index]["vites"];
                                              String kasa =
                                                  arabalarList[index]["kasa"];
                                              String yakit =
                                                  arabalarList[index]["yakit"];
                                              String ucret =
                                                  arabalarList[index]["ucret"];
                                              String logo = iconbmw;
                                              String docid = araba[index].id;
                                              if (arabalarList[index]
                                                      ["marka"] ==
                                                  "BMW") {
                                                logo = iconbmw;
                                              } else if (arabalarList[index]
                                                      ["marka"] ==
                                                  "AUDI") {
                                                logo = iconaudi;
                                              } else if (arabalarList[index]
                                                      ["marka"] ==
                                                  "FIAT") {
                                                logo = iconfiat;
                                              } else if (arabalarList[index]
                                                      ["marka"] ==
                                                  "RENAULT") {
                                                logo = iconrenault;
                                              }

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          arabadetaylarsayfasi(
                                                              hiz,
                                                              kasa,
                                                              logo,
                                                              model,
                                                              resim,
                                                              ucret,
                                                              vites,
                                                              yakit,
                                                              yil,
                                                              docid)));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 41, 141, 223),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    left: 50,
                                                    right: 50),
                                                child: Text(
                                                  "Detaylar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
