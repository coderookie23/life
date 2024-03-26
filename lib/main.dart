import 'package:flutter/material.dart';
import 'package:hope/layers/layer_one.dart';
import 'package:hope/layers/layer_three.dart';
import 'package:hope/layers/layer_two.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login Demo',
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/primaryBg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Gradient "hope" text and sprout, increased size and aligned
            Positioned(
              top: screenHeight / 5 - 100.0, // Adjust this value as needed
              left: 0.0, // Aligned with "Login"
              right: 0.0,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 50.0),
                    painter: HopeSproutPainter(),
                  ),
                  Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xFF00C2FF),
                            Color(0xFF90EE90),
                          ],
                        ).createShader(bounds);
                      },
                      child: Text(
                        "hope",
                        style: TextStyle(
                          fontSize: 88.0, // Increased font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // "Log in" text positioned below "hope"
            Positioned(
              top: screenHeight / 3 - 70.0, // Original position
              left: 59,
              child: Container(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Layers
            Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
            Positioned(top: 320, right: 0, bottom: 48, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}

class HopeSproutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(
        size.width / 2, size.height); // Start at bottom center of the logo
    path.lineTo(
        size.width / 2 - 5, size.height - 10); // Draw a small line upwards
    path.lineTo(
        size.width / 2 + 5,
        size.height -
            10); // Draw another small line upwards to create a Y-shape (sprout)
    path.close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
