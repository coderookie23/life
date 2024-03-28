import 'package:flutter/material.dart';
import 'package:hope/layers/layer_one.dart';
import 'package:hope/layers/layer_three.dart';
import 'package:hope/layers/layer_two.dart';
import 'package:video_player/video_player.dart';

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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/your_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true); // Optional: Loop the video playback
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Video player as background
          VideoPlayer(_controller),
          Container(
            // Optional: Add a black transparent layer on top of the video
            color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
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
                                Color.fromARGB(255, 255, 255, 255),
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
        ],
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
