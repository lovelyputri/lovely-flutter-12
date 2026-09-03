import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; //import supabase 
import 'editSiswa.dart'; // import untuk button edit

class tampilData extends StatefulWidget {
  const tampilData({super.key});

  @override
  State<tampilData> createState() => _tampilDataState();
}

class _tampilDataState extends State<tampilData> {

  List dataSiswa = [];

  final supabase = Supabase.instance.client; // untuk pemanggillan supabase

  Future<void> tampilData() async {
    final data = await supabase.from('siswa').select();
    setState(() {
      dataSiswa = List.from(data);
    });
  }

//pemanggilan halaman id untuk button 
  Future<void> editdata(int id) async { //untuk meng update data otomatis tanpa di refresh
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => 
        editsiswa(
         id: id,
          ),
      ),
    );
    tampilData(); //untuk supaya otomatis ter update
  }

  Future<void> hapusData(int id) async {
    await supabase.from('siswa').delete().eq('id', id);
    tampilData();
  }

  @override
  void initState() {
    super.initState();
    tampilData();
  }

  //memanggil fungsi tampil
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DATA SISWA'), //text didalam header nya
        centerTitle: true, // harus didalam appBar fungsinya untuk menaruh di tengah
        backgroundColor:  Color.fromARGB(255, 255, 168, 207), //warna header
        foregroundColor: Colors.white, //warna dalam header nya (text)
      ),
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          //judul text
          Text('DATA BIODATA SISWA', style: TextStyle(fontWeight: FontWeight.bold)),

          //list data
          Expanded(
            child: ListView.builder(
                itemCount: dataSiswa.length, // ambil data dummy di atas
                itemBuilder: (context, index){
                  return Card(
                    elevation: 10, // bayangan 
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 50, //untuk ukuran bentuk bulat
                        backgroundColor:  Color.fromRGBO(255, 168, 207, 1), //warna icon
                        child: Text(
                          '${index + 1}',
                          style: TextStyle( color: Colors.white),
                      )),
                      title: Text(dataSiswa[index]['nama']),
                      subtitle: Text(dataSiswa[index]['nisn']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            editdata(dataSiswa[index]['id']); //edit sesuai id dan di panggil id 
                          }, icon: Icon(
                            Icons.edit, //icon edit
                            color: Color.fromRGBO(255, 168, 207, 1),
                            )),
                          IconButton(onPressed: () { //button hapus
                            hapusData(dataSiswa[index]['id']); // penghapusan data sesuai denganj id 
                          }, 
                          icon: Icon(
                            Icons.delete, //icon edit
                            color: Color.fromRGBO(245, 107, 169, 1),
                            )),
                        ],
                      ),
                    ),
                  );
                }))
          ]),
        ),
    );
  }
}