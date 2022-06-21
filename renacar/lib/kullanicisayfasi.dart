import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renacar/anasayfa.dart';

class kullanicisayfasi extends StatefulWidget {
  const kullanicisayfasi({Key? key}) : super(key: key);

  @override
  State<kullanicisayfasi> createState() => _kullanicisayfasiState();
}

class _kullanicisayfasiState extends State<kullanicisayfasi> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> arabalarList = [];
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser!.uid;
    final CollectionReference arabaref =
        db.collection("Users").doc(user).collection("Kiralamalar");
    final CollectionReference arabadurumref = db.collection("Arabalar");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 226, 236, 237),
          leading: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Kiralamalarım",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 226, 236, 237),
        body: StreamBuilder<QuerySnapshot>(
            stream: arabaref.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var querySnappshot = snapshot.data;
                var araba = querySnappshot!.docs;
                var mapdata = araba.forEach((doc) async {
                  var veri = doc.data() as Map<dynamic, dynamic>;

                  arabalarList.add(veri);
                });

                return ListView.builder(
                    itemCount: arabalarList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                      onTap: () async {
                                        await arabadurumref
                                            .doc(arabalarList[index]["aracid"])
                                            .update({"durum": true});
                                        await arabaref
                                            .doc(araba[index].id)
                                            .delete();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    anasayfa()));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 41, 141, 223),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 30,
                                              right: 50),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Kiralamayı\n   Bitir",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
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
                    });
              }
            }),
      ),
    );
  }
}
