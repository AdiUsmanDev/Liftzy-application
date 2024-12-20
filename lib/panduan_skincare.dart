import 'package:flutter/material.dart';

class PanduanSkincare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.purple[100],
      ),
      backgroundColor: Colors.purple[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Untuk yoga wajah anda memerlukan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductIcon('images/moist.png', 'Moisturizer Cream'),
                  Row(
                    children: [
                      _buildProductIcon('images/mask.png', 'Moisturizer Mask'),
                      _buildProductIcon('images/lotion.png', 'Lotion'),
                    ],
                  ),
                  _buildProductIcon('images/scrub.png', 'Scrub'),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Siapkan kulitmu untuk yoga wajah',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 143, 78, 155)),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildPreparationStep(
                            'images/cucimuka.png', 'Bersihkan wajahmu'),
                        _buildPreparationStep(
                            'images/pakaicream.png', 'Oleskan toner'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Gunakan produk minyak pijat',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 143, 78, 155)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPreparationStep('images/cucimuka.png',
                            'Oleskan cream atau minyak pijat'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 143, 78, 155),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(
                        double.infinity, 50), // Memastikan tombol selebar layar
                  ),
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductIcon(String imagePath, String label) {
    return Row(
      children: [
        Image.asset(imagePath,
            width: 50, height: 50), // Adjust as per your icon size
        SizedBox(width: 10.0),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPreparationStep(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(imagePath,
            width: 80, height: 80), // Adjust size accordingly
        SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


