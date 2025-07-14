import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Navigation.dart';

//uygulama başlatılırken ilk çalışan fonksiyon
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //widget oluşturma fonksiyonu
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolyo',
      theme: ThemeData(
        //uygulamanın genel tema ve görünüm ayaları
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const Navigation(), //uygulama açıldığında gösterilecke ilk sayfa.
    );
  }
}
