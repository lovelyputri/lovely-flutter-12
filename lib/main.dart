import 'package:flutter/material.dart';
import 'package:flutter_biodata/tampilanAwal.dart'; // import file baru 
import 'package:supabase_flutter/supabase_flutter.dart'; //import supabase 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zaxjzrnweytufnwqigwn.supabase.co', //url ambil di website supabase 
    publishableKey: 'sb_publishable_YMpaoI1K1SXe7Zt282x1cA_CFYpVduN', //url juga sama ambil di supabase copy
  );
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