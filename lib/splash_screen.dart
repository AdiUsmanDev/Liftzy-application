import 'package:flutter/material.dart';
import 'package:ui/get_started.dart'; // Ensure the correct import

class TampilanAwalScreen extends StatefulWidget {
  const TampilanAwalScreen({super.key});

  @override
  _TampilanAwalScreenState createState() => _TampilanAwalScreenState();
}

class _TampilanAwalScreenState extends State<TampilanAwalScreen> {
  
  @override
  void initState() {
    super.initState();
    // Navigate to GetStarted after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      _navigateToGetStarted();
    });
  }

  void _navigateToGetStarted() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MemulaiScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // Slide from bottom
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _navigateToGetStarted, // Navigate on tap
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple[100], // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image.asset('images/logo.png'), // Your logo asset
              ),
              SizedBox(height: 10),
              Text(
                'LIFTZY',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Yoga Mudah, Kecantikan Natural',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}