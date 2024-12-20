import 'package:flutter/material.dart';

class DetailProgram7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
        ),
        backgroundColor: Colors.purple[100],
      ),
      body: Column(
        children: [
          // Container untuk judul
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Yoga Wajah menggunakan Gua-sha',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 143, 78, 155),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 16.0), // Margin atas untuk jarak dengan judul
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Warna bayangan dengan transparansi
                    offset: Offset(0, 2), // Posisi bayangan
                    blurRadius: 4.0, // Radius blur bayangan
                  ),
                ],
              ),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ExerciseStep(
                    stepNumber: 1,
                    stepText: "Bersihkan wajah dan aplikasikan serum atau minyak wajah agar Gua Sha meluncur dengan lembut. Pastikan alat Gua Sha bersih dan bebas dari kotoran.",
                  ),
                  ExerciseStep(
                    stepNumber: 2,
                    stepText: "Mulai dari bagian tengah dahi. Letakkan Gua Sha di atas alis dan geser ke atas menuju garis rambut. ",
                  ),
                  ExerciseStep(
                    stepNumber: 3,
                    stepText: "Gunakan sisi panjang Gua Sha dengan tekanan ringan.",
                  ),
                  ExerciseStep(
                    stepNumber: 4,
                    stepText: "Ulangi sebanyak 5-10 kali pada setiap sisi dahi.",
                  ),
                  ExerciseStep(
                    stepNumber: 5,
                    stepText: "Mulai dari bagian samping hidung. Geser Gua Sha secara perlahan ke arah luar menuju tulang pipi dan telinga. Lakukan gerakan ini dengan sisi miring alat untuk menjangkau tulang pipi. Ulangi sebanyak 5-10 kali di setiap sisi.",
                  ),
                  ExerciseStep(
                    stepNumber: 6,
                    stepText: "Letakkan Gua Sha di dagu, dekat garis rahang. Geser perlahan ke arah telinga dengan tekanan sedang. Gunakan sisi cekung alat untuk mengikuti garis rahang. Ulangi sebanyak 5-10 kali di kedua sisi wajah.",
                  ),
                  ExerciseStep(
                    stepNumber: 7,
                    stepText: "Geser alat dari pangkal leher ke arah atas, menuju garis rahang. Fokus pada gerakan ke atas untuk membantu aliran limfatik. Ulangi sebanyak 10 kali.",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/program_selesai');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromARGB(255, 143, 78, 155), // Mengubah warna latar belakang menjadi putih
                side: BorderSide(color:Color.fromARGB(255, 143, 78, 155), width: 1), // Menambahkan border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(double.infinity, 50), // Memastikan tombol selebar layar
              ),
              child: Text(
                "Selesai",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white, // Mengubah warna teks agar kontras
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseStep extends StatelessWidget {
  final int stepNumber;
  final String stepText;

  ExerciseStep({required this.stepNumber, required this.stepText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color.fromARGB(255, 143, 78, 155),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color.fromARGB(255, 143, 78, 155),
            child: Text(
              stepNumber.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              stepText,
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}