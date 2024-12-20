import 'package:flutter/material.dart';

class MemulaiScreen extends StatefulWidget {
  const MemulaiScreen({super.key});

  @override
  _MemulaiScreenState createState() => _MemulaiScreenState();
}

class _MemulaiScreenState extends State<MemulaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Greeting text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Selamat datang di ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900], // Color for the first part
                          ),
                        ),
                        TextSpan(
                          text: 'LIFTZY',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Color for the second part
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10), // Space below the greeting text
                  Text(
                    'Setiap langkah kecil membawa perubahan besar pada kesehatan dan kecantikan wajahmu',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Image comparison section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for the first image
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                        image: AssetImage('images/memulai.png'), // replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 350,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Start button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up'); // Navigate to signup screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[700],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Mulai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // "Sudah punya akun?" and "Masuk" text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login'); // Navigate to login screen
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
