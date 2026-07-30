import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; //import supabase 

class tampilanAwal extends StatefulWidget {
  const tampilanAwal({super.key});

  @override
  State<tampilanAwal> createState() => _tampilanAwalState();
}

class _tampilanAwalState extends State<tampilanAwal> {
  final namaController = TextEditingController(); //tambah controller untuk menampung data inputan
  final kelasController = TextEditingController();
  final nisnController = TextEditingController();
  final alamatController = TextEditingController();
  final jurusanController = TextEditingController();
  final hobiController = TextEditingController();

  final supabase = Supabase.instance.client; // untuk pemanggillan supabase

  //simpan data ke supabase
  void simpanData() async {
    await supabase.from('siswa').insert({ // siswa merupakan nama tabel yang ada disupabase, insert untuk menambhakan data 
      'nama': namaController.text, 
      'kelas': kelasController.text,
      'nisn': nisnController.text,
      'alamat': alamatController.text,
      'jurusan': jurusanController.text,
      'hobi': hobiController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FORM BIODATA'), //text didalam header nya
        centerTitle: true, // harus didalam appBar fungsinya untuk menaruh di tengah
        backgroundColor:  Color.fromARGB(255, 255, 168, 207), //warna header
        foregroundColor: Colors.white, //warna dalam header nya (text)
      ),
      body: Padding(padding: EdgeInsets.all(20), // mengatur jarak antar sisi
        child: Card(
          elevation: 10, //bayangan atau shadow
          child: Padding(padding: EdgeInsets.all(20), //mengatur jarak antar sisi card
          child: SingleChildScrollView(
            child: Column(children: [
              CircleAvatar(
                radius: 50, //untuk ukuran bentuk bulat
                backgroundColor:  Color.fromARGB(255, 255, 168, 207), //warna icon
                child: Icon(Icons.person, // bentuk atau jenis icon 
                color: Colors.white, //warna icon
                size: 55, // ukuran icon
                ),
              ),
              SizedBox(height: 20,), // mengasih jarak dari icon
              Text('DATA BIODATA SISWA', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4), // mengasih jarak dari icon
              Text('Lengkapi data dibawah ini', style: TextStyle(fontSize: 10)),
              SizedBox(
                height: 30
              ),
              TextField(
                controller: namaController, //untuk pemanggilan controller 
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
               TextField(
                controller: kelasController, //untuk pemanggilan controller 
                decoration: InputDecoration(
                  labelText: 'Kelas',
                  prefixIcon: Icon(Icons.meeting_room),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
               TextField(
                controller: nisnController, //untuk pemanggilan controller 
                decoration: InputDecoration(
                  labelText: 'NISN',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
               TextField(
                controller: alamatController, //untuk pemanggilan controller 
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              SizedBox(
                height: 10, // untuk jarak
              ),
              TextField(
                controller: jurusanController, //untuk pemanggilan controller 
                decoration: InputDecoration(
                  labelText: 'Jurusan',
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              SizedBox(
                height: 10, // untuk jarak
              ),
              TextField(
                controller: hobiController, //untuk pemanggilan controller 
                decoration: InputDecoration(
                  labelText: 'Hobi',
                  prefixIcon: Icon(Icons.interests),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              SizedBox(
                height: 30, // untuk jarak
              ),
              SizedBox(
                width: double.infinity,
                height: 45,// memanjangkan button
                child: ElevatedButton(onPressed: () async {
                  simpanData(); // untuk memanggil fungsi simpan data
                },  // untuk memebuat button
                 child: Text('Submit'),
                 style: ElevatedButton.styleFrom( // untuk kasih style pada button
                  backgroundColor: Color.fromARGB(255, 255, 168, 207), // warna backround button
                  foregroundColor: Colors.white, // warna text button
                  textStyle: TextStyle(fontSize: 18),
                 ),
                ),
              ),
            ]),
          )),
        ),
      ), 
    );
  }
}