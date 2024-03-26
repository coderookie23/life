import 'package:flutter/material.dart';
import 'package:flutter/animation.dart'; // Import for animations

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  // Animation controllers
  late final AnimationController _logoAnimationController;
  late final Animation<double> _logoScaleAnimation;
  late final AnimationController _fieldsAnimationController;
  late final Animation<Offset> _fieldsSlideAnimation;
  late final AnimationController _buttonAnimationController;
  late final Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _logoScaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_logoAnimationController);

    _fieldsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fieldsSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(_fieldsAnimationController);

    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _buttonScaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_buttonAnimationController);

    // Play animations sequentially
    _logoAnimationController.forward();
    _logoAnimationController.addListener(() {
      if (_logoAnimationController.isCompleted) {
        _fieldsAnimationController.forward();
      }
    });
    _fieldsAnimationController.addListener(() {
      if (_fieldsAnimationController.isCompleted) {
        _buttonAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _fieldsAnimationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Background color
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _logoAnimationController,
                builder: (context, child) => Transform.scale(
                  scale: _logoScaleAnimation.value,
                  child: child,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              AnimatedBuilder(
                animation: _fieldsAnimationController,
                builder: (context, child) => SlideTransition(
                  position: _fieldsSlideAnimation,
                  child: child,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _email = newValue!,
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _password = newValue!,
                      ),
                      const SizedBox(height: 24.0),
                      AnimatedBuilder(
                        animation: _buttonAnimationController,
                        builder: (context, child) => Transform.scale(
                          scale: _buttonScaleAnimation.value,
                          child: child,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle login logic here (e.g., form validation, API call)
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Simulate login process (replace with actual logic)
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              });
                            }
                          },
                          child: const Text('Login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .white, // Use backgroundColor instead of primary
                            foregroundColor: Colors
                                .blue, // Use foregroundColor instead of onPrimary
                            minimumSize: const Size(double.infinity, 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// This is where the continuation of the code begins

