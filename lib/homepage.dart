import 'package:flutter/material.dart';
import 'package:ui/kumpulan_prep_program.dart';
import 'package:ui/profile_page.dart';

class ProgramHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 190, 231),
      body: Column(
        children: [
          // App Bar Container with Logo
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
          
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                Column(
                  children: [
                    Text(
                      'Panduan Skincare Program Eksternal Liftzy',
                      style: TextStyle(
                        fontSize: 18.0, // Meningkatkan ukuran font
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 143, 78, 155),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                        height:
                            20), // Menambahkan jarak antara teks dan kontainer
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 250, 222, 255), // Warna latar belakang
                        borderRadius:
                            BorderRadius.circular(15), // Sudut membulat
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Warna bayangan
                            blurRadius: 8.0, // Seberapa blur bayangan
                            offset: Offset(0, 4), // Posisi bayangan
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(
                          20), // Menambahkan padding di dalam kontainer
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_online,
                            color: Color.fromARGB(
                                255, 143, 78, 155), // Mengubah warna ikon
                            size: 60.0, // Meningkatkan ukuran ikon
                          ),
                          SizedBox(
                              height:
                                  15), // Menambahkan jarak antara ikon dan tombol
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/panduan_skincare');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 143, 78, 155),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: Text(
                              "Lihat Panduan",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                // Additional Programs
                SectionWidget(
                  title: "Yoga Wajah Anti Kerutan",
                  items: [
                    MassageItem(
                      title: 'Kerutan di Antara Alis',
                      duration: '5 min',
                      tahapan: '7 Tahapan',
                      imagePath: 'images/model5.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Menghilangkan Kerutan',
                        subtitle: 'Di Antara Alis',
                        description:
                            'Yoga ini berfokus pada area antara alis untuk mengurangi garis-garis halus akibat ekspresi wajah seperti mengerutkan dahi.',
                        imagePath: 'images/model7.jpg',
                        buttonRoute: '/detail_program_1',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Mengurangi garis halus di antara alis.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Merelaksasi otot dahi.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Meningkatkan sirkulasi darah pada area wajah.'
                          },
                        ],
                      ),
                    ),
                    MassageItem(
                      title: 'Kelopak Mata Turun',
                      duration: '5 min',
                      tahapan: '7 Tahapan',
                      imagePath: 'images/model6.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Menghilangkan',
                        subtitle: 'Kelopak Mata Turun',
                        description:
                            'Yoga ini dirancang untuk mengencangkan otot di sekitar kelopak mata atas yang mulai kendur, membantu tampilan mata lebih segar dan terbuka.',
                        imagePath: 'images/model6.jpg',
                        buttonRoute: '/detail_program_2',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Mengurangi tampilan kelopak mata yang turun.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Membantu meningkatkan elastisitas kulit di sekitar mata.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Memberikan tampilan mata yang lebih cerah dan segar.'
                          },
                        ],
                      ),
                    ),
                    MassageItem(
                      title: 'Lipatan Hidung',
                      duration: '5 min',
                      tahapan: '6 Tahapan',
                      imagePath: 'images/model9.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Menghilangkan',
                        subtitle: 'Lipatan Hidung',
                        description:
                            'Yoga ini berfokus pada area lipatan di antara hidung dan sudut bibir untuk mengurangi garis senyum dan mengencangkan kulit.',
                        imagePath: 'images/model9.jpg',
                        buttonRoute: '/detail_program_3',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Mengurangi tampilan lipatan nasolabial (garis senyum).'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Mengencangkan kulit wajah bagian tengah.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Memperbaiki kontur wajah secara alami.'
                          },
                        ],
                      ),
                    ),
                    MassageItem(
                      title: 'Pijatan Pengencangan Mata',
                      duration: '5 min',
                      tahapan: '6 Tahapan',
                      imagePath: 'images/model10.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Pijatan',
                        subtitle: 'Pengencangan',
                        description:
                            'Yoga ini dirancang untuk mengangkat area sekitar mata, mengurangi kantung mata, dan mengencangkan kulit di sekitar kelopak mata.',
                        imagePath: 'images/model10.jpg',
                        buttonRoute: '/detail_program_4',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Mengurangi lingkaran hitam dan kantung mata.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Mengencangkan kulit di sekitar mata.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Membantu mata terlihat lebih besar dan terangkat.'
                          },
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SectionWidget(
                  title: "Yoga Penghilang Bengkak Wajah",
                  items: [
                    MassageItem(
                      title: 'Pijatan Pengangkatan Wajah',
                      duration: '5 min',
                      tahapan: '4 Tahapan',
                      imagePath: 'images/model11.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Pijatan',
                        subtitle: 'Pengangkatan Wajah',
                        description:
                            'Yoga ini bertujuan untuk mengencangkan kulit wajah secara keseluruhan, memberikan efek wajah yang lebih muda dan kencang.',
                        imagePath: 'images/model12.jpg',
                        buttonRoute: '/detail_program_5',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Mengurangi tanda-tanda penuaan seperti keriput dan kulit kendur.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Membentuk kontur wajah yang lebih tajam.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Meningkatkan produksi kolagen alami pada kulit.'
                          },
                        ],
                      ),
                    ),
                    MassageItem(
                      title: 'Pijatan dengan Face Roller',
                      duration: '5 min',
                      tahapan: '6 Tahapan',
                      imagePath: 'images/model12.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Pijatan',
                        subtitle: 'dengan Face Roller',
                        description:
                            'Yoga menggunakan alat seperti face roller untuk memijat wajah, teknik ini membantu meredakan bengkak dan meningkatkan aliran darah di wajah.',
                        imagePath: 'images/model12.jpg',
                        buttonRoute: '/detail_program_6',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Mengurangi bengkak pada wajah.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Merangsang sirkulasi darah untuk kulit yang lebih bercahaya.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Membantu penyerapan produk perawatan kulit.'
                          },
                        ],
                      ),
                    ),
                    MassageItem(
                      title: 'Pijatan dengan Gua-Sha',
                      duration: '11 min',
                      tahapan: '7 Tahapan',
                      imagePath: 'images/model13.jpg',
                      color: Color.fromARGB(255, 143, 78, 155),
                      destinationPage: PreparationProgramScreen(
                        title: 'Yoga Wajah: Pijatan',
                        subtitle: 'dengan Gua-sha',
                        description:
                            'Yoga menggunakan alat seperti face roller untuk memijat wajah, teknik ini membantu meredakan bengkak dan meningkatkan aliran darah di wajah.',
                        imagePath: 'images/model13.jpg',
                        buttonRoute: '/detail_program_7',
                        benefits: [
                          {
                            'iconPath': 'images/Check.png',
                            'text': 'Mengurangi bengkak pada wajah.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Merangsang sirkulasi darah untuk kulit yang lebih bercahaya.'
                          },
                          {
                            'iconPath': 'images/Check.png',
                            'text':
                                'Membantu mata terlihat lebih besar dan terangkat.'
                          },
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(
            255, 143, 78, 155), // Background color sesuai permintaan
        selectedItemColor: Colors.white, // Warna icon yang dipilih
        unselectedItemColor: Colors.purple[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Navigasi ke halaman profil ketika ikon Profile ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final List<MassageItem> items;

  SectionWidget({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 143, 78, 155),
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman spesifik untuk item ini
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item.destinationPage,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Gambar Persegi Panjang
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(item.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Row dengan Background Ungu
                      Container(
                        color: Color.fromARGB(255, 143, 78, 155),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time, // Ikon waktu
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                    width: 5), // Spasi antara ikon dan teks
                                Text(
                                  item.duration,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.list_alt, // Ikon langkah/tahapan
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                    width: 5), // Spasi antara ikon dan teks
                                Text(
                                  item.tahapan,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Judul dengan Background Ungu Tua
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 103, 53, 115), // Ungu Tua
                            borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(8.0), // Lengkungan kiri bawah
                              bottomRight: Radius.circular(
                                  8.0), // Lengkungan kanan bawah
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MassageItem {
  final String title;
  final String duration;
  final String tahapan;
  final Color color;
  final String imagePath;
  final Widget destinationPage; // Halaman tujuan berbeda

  MassageItem({
    required this.title,
    required this.duration,
    required this.tahapan,
    required this.color,
    required this.imagePath,
    required this.destinationPage,
  });
}
