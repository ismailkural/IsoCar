import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:renacar/anasayfa.dart';
import 'package:renacar/firebase_options.dart';
import 'package:renacar/girissayfasi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: rentacar(),
  ));
}

class rentacar extends StatelessWidget {
  const rentacar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return girissayfasi();
  }
}
