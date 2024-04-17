import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdm6/list_widget.dart';

import 'firebase_options.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "PDM6",
      home: LoginPage(),
    )
  );
}
