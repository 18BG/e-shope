import 'package:e_shope/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(EcommerceApp());

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    PayProductScreen(),
    TrackOrderScreen(),
    DeliveryScreen(),
  ];

  final List<String> _screenTitles = [
    'Pay for Product',
    'Track Your Order',
    'Delivery',
  ];

  final List<String> _screenDescriptions = [
    'Discover and pay for your favorite products with ease.',
    'Stay updated with the status of your orders anytime.',
    'Get your products delivered to your doorstep hassle-free.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitles[_currentIndex]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.asset(
              'assets/images/splash_screen_image_$_currentIndex.png',
              width: MediaQuery.of(context).size.height * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: 20),
            Text(
              _screenDescriptions[_currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width *
                  0.99999999999999999999999999,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex < _screens.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                  } else {
                    // Navigate to the login screen when all screens are shown.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            ConvexAppExample(), // Replace with your login screen
                      ),
                    );
                  }
                },
                child: Text(
                  _currentIndex < _screens.length - 1
                      ? 'Suivant'
                      : 'Get Started',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PayProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pay for your favorite products here.'),
    );
  }
}

class TrackOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Track the status of your orders here.'),
    );
  }
}

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/delivery_image.png',
            width: 150,
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to Our Delivery Service',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'We deliver your products to your doorstep. Get started now!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
