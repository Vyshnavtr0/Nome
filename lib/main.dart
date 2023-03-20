import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/LoginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDpD9tp3fvxdB6TNRPpGs6ZLOTiAQBcVfo",
          appId: "1:286907774332:web:00a172f5876f3fca0fe0f9",
          messagingSenderId: "286907774332",
          projectId: "nome-95866"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      title: "Notes Media",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
