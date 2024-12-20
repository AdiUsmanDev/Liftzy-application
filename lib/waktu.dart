import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YogaFaceScreen(),
    );
  }
}

class YogaFaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 190, 231), // Warna latar belakang ditambahkan
      body: Column(
        children: [
          // App Bar Container dengan Logo
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 143, 78, 155),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'images/logo.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Spasi di bawah App Bar

          // Konten Utama
          Expanded(
            child: Column(
              children: [
                // Bagian "Tujuan Minggu"
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TUJUAN MINGGU',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            {'day': 'Sen', 'date': 1},
                            {'day': 'Sel', 'date': 2},
                            {'day': 'Rab', 'date': 3},
                            {'day': 'Kam', 'date': 4},
                            {'day': 'Jum', 'date': 5},
                            {'day': 'Sab', 'date': 6},
                            {'day': 'Min', 'date': 7},
                          ].map((dayData) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Aksi yang dilakukan saat hari diklik
                                    print(
                                        'Hari ${dayData['day']} dengan tanggal ${dayData['date']} diklik');
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: dayData['day'] == 'Rab'
                                        ? Colors.purple[100]
                                        : Colors.grey[300],
                                    child: Text(
                                      dayData['day'].toString().substring(0, 1),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '${dayData['date']}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        ListTile(
                          leading:
                              Icon(Icons.play_circle_fill, color: Colors.blue),
                          title: Text('AntiAging'),
                          subtitle: Text('30 Hari'),
                          trailing: Text('0%'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        // Tambahkan teks di atas Card
                        Center(
                          child: Text(
                            'Program Yoga Wajah',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Jarak antara teks dan Card
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'AntiAging',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('30 Hari'),
                                        Row(
                                          children: [
                                            // Tombol mulai dengan ElevatedButton
                                            ElevatedButton(
                                              onPressed: () {
                                                // Aksi yang dilakukan saat tombol diklik
                                                print('Program Utama');
                                              },
                                              style:
                                                  ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.purple[100],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text('Mulai'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
