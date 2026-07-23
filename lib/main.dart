import 'package:flutter/material.dart';
import 'package:flutter_biodata/tampilanAwal.dart'; // import file baru 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: tampilanAwal(), // untuk menampilkan file tampilanAwal
    );
  }
}