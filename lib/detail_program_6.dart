import 'package:flutter/material.dart';

class DetailProgram6 extends StatelessWidget {
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
              'Yoga Wajah menggunakan Face Roller',
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
                    stepText: "Siapkan roller wajah (baik jade roller atau gua sha) dan dinginkan di kulkas terlebih dahulu untuk efek menenangkan.",
                  ),
                  ExerciseStep(
                    stepNumber: 2,
                    stepText: "Gulirkan roller ke arah luar (ke arah pelipis).",
                  ),
                  ExerciseStep(
                    stepNumber: 3,
                    stepText: "Lakukan gerakan ini sebanyak 5-10 kali di setiap sisi.",
                  ),
                  ExerciseStep(
                    stepNumber: 4,
                    stepText: "Gunakan sisi kecil roller dan mulailah dari sudut dalam mata.",
                  ),
                  ExerciseStep(
                    stepNumber: 5,
                    stepText: "Gulirkan ke arah luar (ke pelipis) dengan tekanan sangat ringan. Dan ulangi sebanyak 5-10 kali.",
                  ),
                  ExerciseStep(
                    stepNumber: 6,
                    stepText: "Akhiri dengan menggunakan roller pada garis rahang ke arah leher untuk membantu mengalirkan cairan limfatik.",
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