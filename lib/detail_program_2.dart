import 'package:flutter/material.dart';

class DetailProgram2 extends StatelessWidget {
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
              'Yoga Wajah: Menghilangkan Kelopak Mata Turun',
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
                    stepText: "Letakkan jari telunjuk di bawah alis, dekat dengan tulang alis.",
                  ),
                  ExerciseStep(
                    stepNumber: 2,
                    stepText: "Dorong alis ke arah atas dengan tekanan lembut menggunakan jari telunjuk.",
                  ),
                  ExerciseStep(
                    stepNumber: 3,
                    stepText: "Sambil menekan, tutup mata perlahan hingga Anda merasakan tarikan pada kelopak mata.",
                  ),
                  ExerciseStep(
                    stepNumber: 4,
                    stepText: "Tahan posisi ini selama 5-10 detik, lalu lepaskan.",
                  ),
                  ExerciseStep(
                    stepNumber: 5,
                    stepText: "Ulangi gerakan sebanyak 5 kali.",
                  ),
                   ExerciseStep(
                    stepNumber: 6,
                    stepText: "Gunakan kedua jari telunjuk untuk memijat area sekitar kelopak mata atas dengan gerakan melingkar, mulai dari sudut dalam ke sudut luar mata.",
                  ),
                   ExerciseStep(
                    stepNumber: 7,
                    stepText: "Akhiri dengan menekan ringan sudut luar mata selama 10 detik untuk merangsang sirkulasi darah.",
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